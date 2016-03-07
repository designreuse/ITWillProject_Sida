package mybatis.mapper;

import java.util.ArrayList;
import java.util.HashMap;

import com.itwill.sida.dto.AddressBook;
import com.itwill.sida.dto.Member;

public interface AddressBookMapper {
	AddressBook selectAddressOne(String ad_no);
	void createAddress(AddressBook addressBook);
	void updateAddress(AddressBook addressBook);
	void deleteAddress(String ad_no);
	ArrayList<AddressBook> selectAddressList(String m_email);
	
	ArrayList<AddressBook> findAddressByCompany(HashMap<String, String> cMap);
	ArrayList<AddressBook> findAddressByName(HashMap<String, String> cMap);
	ArrayList<AddressBook> findAddressByNumber(HashMap<String, String> cMap);
	void updateImg(String sMember);
	HashMap<String, Object> selectAdImage(String ad_no);
	void updateAddressBookImage(AddressBook addressBook);
}
