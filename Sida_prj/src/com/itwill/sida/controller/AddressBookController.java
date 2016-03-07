package com.itwill.sida.controller;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.portable.ApplicationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwill.sida.dto.AddressBook;
import com.itwill.sida.dto.Member;
import com.itwill.sida.dto.Scheduler;
import com.itwill.sida.service.AddressBookService;
import com.itwill.sida.service.SchedulerService;
import com.itwill.sida.service.TextFormatUtil;

@Controller
public class AddressBookController {
	String LOCAL_FILE_SAVE_PATH;
	public final String LOCAL_FILE_LOAD_PATH = "localImg" + File.separator;

	@Autowired
	AddressBookService addressBookService;
	@Autowired
	SchedulerService schedulerService;
	@Autowired
	TextFormatUtil textFormatUtil;

	@RequestMapping("/getAddressBookImage/{ad_no}")
	public ResponseEntity<byte[]> getAddressBookImage(@PathVariable("ad_no") String ad_no, HttpServletRequest req,
			HttpServletResponse res) throws SQLException {
		HashMap<String, Object> hMap = addressBookService.selectAdImage(ad_no);
		Blob blogImage = (Blob) hMap.get("AD_IMAGE");
		byte[] blogImageBytes = blogImage.getBytes(1L, (int)blogImage.length());
		blogImageBytes=scale(blogImageBytes, 140, 140);
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_PNG);
		return new ResponseEntity<byte[]>(blogImageBytes, headers, HttpStatus.OK);
	}
	public byte[] scale(byte[] imageByteData, int width, int height) {
    	ByteArrayInputStream in = new ByteArrayInputStream(imageByteData);
    	try {
    		BufferedImage img = ImageIO.read(in);
    		if(height == 0) {
    			height = (width * img.getHeight())/ img.getWidth(); 
    		}
    		if(width == 0) {
    			width = (height * img.getWidth())/ img.getHeight();
    		}
    		Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
    		BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    		imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0,0,0), null);

    		ByteArrayOutputStream buffer = new ByteArrayOutputStream();
    		ImageIO.write(imageBuff, "png", buffer);
    		return buffer.toByteArray();
    	} catch (IOException e) {
    	}
    	return null;
    }

	@RequestMapping("addressbook")
	public String addressbook(Model model, HttpSession session) {
		String forwardPath = "index";
		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");
		ArrayList<AddressBook> addressBookList = addressBookService.getAddressList(member.getM_email());
		// 상단 Nav바 지출내역 리스트
		ArrayList<HashMap<String, String>> moneyMap = textFormatUtil.head_Nav_CardUseList(member.getM_email());
		model.addAttribute("head_nav_moneyList_size", moneyMap.size());
		model.addAttribute("head_nav_moneyList", moneyMap);
		//
		/**************** 상단 nav schedule 알람 *************************/
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String strDate = sdf.format(new Date());
		HashMap<String, String> sMap = new HashMap<String, String>();
		sMap.put("s_m_email", member.getM_email());
		sMap.put("s_end", strDate);
		List<Scheduler> scList = schedulerService.selectforHeadNav(sMap);
		model.addAttribute("scList", scList);
		/*****************************************************************/
		model.addAttribute("addressBookList", addressBookList);
		model.addAttribute("path", "addressbook.jsp");
		/*
		 * for(AddressBook arr : addressBookList){ for(byte
		 * aaaa:arr.getAd_image()){ System.err.print(aaaa); } }
		 */
		return forwardPath;
	}

	@RequestMapping("searchAddress")
	public String searchAddress(@RequestParam(value = "optionsRadios", required = false) int r_value,
			@RequestParam(value = "s_text", required = false) String s_text, Model model, HttpSession session) {
		String forwardPath = "index";
		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");
		String ad_m_email = member.getM_email();
		ArrayList<AddressBook> addressBookList = null;
		HashMap<String, String> cMap = new HashMap<String,String>();
		cMap.put("s_text", s_text);
		cMap.put("ad_m_email", ad_m_email);
		if (r_value == 1) {
			addressBookList = addressBookService.findAddressByCompany(cMap);
		} else if (r_value == 2) {
			addressBookList = addressBookService.findAddressByName(cMap);
		} else if (r_value == 3) {
			addressBookList = addressBookService.findAddressByNumber(cMap);
		}
		model.addAttribute("addressBookList", addressBookList);
		model.addAttribute("path", "addressbook.jsp");
		return forwardPath;
	}

	
	@RequestMapping("ad_imageModify")
	public String ad_imageModify(@RequestParam("ad_no") String ad_no,
								@RequestParam(value = "userImg", required = false) MultipartFile userImg,
								HttpSession session,
								Model model){
		String forwardPath = "editAddressBookForm";
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		AddressBook addressBooks = addressBookService.getAddress(ad_no);
		try{
			addressBooks.setAd_image(userImg.getBytes());
		} catch (IOException e) {
		}
		AddressBook addressBook = addressBookService.getAddress(ad_no);
		addressBookService.addressBookImageModify(addressBooks);
		model.addAttribute("addressBook", addressBook);
		return forwardPath;
	}
	@RequestMapping("editAddressBookForm")
	public String editAddressBookForm(@RequestParam("ad_no") String ad_no, Model model) {
		String forwardPath = "editAddressBookForm";
		AddressBook addressBook = addressBookService.getAddress(ad_no);
		model.addAttribute("addressBook", addressBook);
		return forwardPath;
	}
	@RequestMapping("editAddressBook")
	public String editAddressBook(@RequestParam("ad_no") String ad_no,
			@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "company", required = false) String company,
			@RequestParam(value = "mobile", required = false) String mobile,
			@RequestParam(value = "home_phones", required = false) String home_phones,
			@RequestParam(value = "extension_number", required = false) String extension_number,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "card", required = false) String card,
			@RequestParam(value = "memo", required = false) String memo,
			HttpSession session,
			Model model) {

		String forwardPath = "editAddressBookForm";
		if (session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		
		AddressBook addressBooks = addressBookService.getAddress(ad_no);
		String ad_m_email = addressBooks.getAd_m_email();
		
		addressBooks.setAd_m_email(ad_m_email);
		addressBooks.setAd_name(name);
		addressBooks.setAd_company(company);
		addressBooks.setAd_mnumber(mobile);
		addressBooks.setAd_hnumber(home_phones);
		addressBooks.setAd_cnumber(extension_number);
		addressBooks.setAd_address(address);
		addressBooks.setAd_email(email);
		addressBooks.setAd_memo(memo);
		
		addressBookService.editAddress(addressBooks);
		model.addAttribute("closeFlag", true);
		return forwardPath;
	}

	@RequestMapping("deleteAddress")
	public String deleteAddress(@RequestParam("ad_no") String ad_no, Model model, HttpSession session) {
		String forwardPath = "index";
		addressBookService.deleteAddress(ad_no);
		if ((Member) session.getAttribute("sMember") == null) {
			return "redirect:login";
		}
		Member member = (Member) session.getAttribute("sMember");
		ArrayList<AddressBook> addressBookList = addressBookService.getAddressList(member.getM_email());

		model.addAttribute("addressBookList", addressBookList);
		model.addAttribute("path", "addressbook.jsp");
		return forwardPath;
	}

	@RequestMapping("addressBookAddForm")
	public String addressBookaddForm(Model model, HttpSession session) {
		String forwardPath = "addressBookAddForm";
		return forwardPath;
	}

	@RequestMapping("addAddressBook")
	public String addAddressBook(@RequestParam(value = "name", required = false) String name,
			@RequestParam(value = "company", required = false) String company,
			@RequestParam(value = "mobile", required = false) String mobile,
			@RequestParam(value = "home_phones", required = false) String home_phones,
			@RequestParam(value = "extension_number", required = false) String extension_number,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "card", required = false) String card,
			@RequestParam(value = "memo", required = false) String memo, 
			@RequestParam("cardImg") MultipartFile cardImg,
			HttpSession session, Model model) {
		String forwardPath = "addressBookAddForm";
		// HashMap<String, String> cMap = new HashMap<String, String>();
		Member member = (Member) session.getAttribute("sMember");
		/* AddressBook imgPathAddressBook = (AddressBook) session.getAttribute("imagePathAddr");
		String img = imgPathAddressBook.getAd_image(); */
		String ad_m_email = member.getM_email();

		AddressBook addressBook = new AddressBook();
		try {
			addressBook.setAd_m_email(ad_m_email);
			addressBook.setAd_name(name);
			addressBook.setAd_company(company);
			addressBook.setAd_mnumber(mobile);
			addressBook.setAd_hnumber(home_phones);
			addressBook.setAd_cnumber(extension_number);
			addressBook.setAd_address(address);
			addressBook.setAd_email(email);
			addressBook.setAd_image(cardImg.getBytes());
			addressBook.setAd_memo(memo);
		} catch (IOException e) {
		}

		addressBookService.addressRegist(addressBook);
		model.addAttribute("closeFlag", true);
		return forwardPath;
	}

	private void writeFile(MultipartFile file, String path, String fileName) {
		FileOutputStream fos = null;
		try {
			byte fileData[] = file.getBytes();
			fos = new FileOutputStream(path + fileName);
			fos.write(fileData);
		} catch (Exception e) {

		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (Exception e) {
				}
			}
		}
	}
}
