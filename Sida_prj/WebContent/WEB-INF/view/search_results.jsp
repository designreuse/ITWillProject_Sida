<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- BODY -->
            <div class="body">


                <section class="content">
                    
<ol class="breadcrumb">
    <li><a href="index.html"><i class="fa fa-home fa-fw"></i> Home</a></li>
    <li class="active">Search Results</li>
</ol>

<div class="header">
    <div class="col-md-12">
        <h3 class="header-title">Search Results</h3>
        <p class="header-info">Get instant access to all data in your website</p>
    </div>
</div>

<!-- SEARCH FORM -->
<div class="search active">
    <a href="#" class="btn btn-search"><i class="fa fa-search fa-fw"></i></a>
    <div class="search-form">
        <h5>Search Users</h5>
        <form>
            <div class="form-group">
                <div class="input-group">
                    <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Search">
                    <span class="input-group-addon">
                        <i class="fa fa-search"></i>
                    </span>
                </div>
            </div>
            <div class="row">
            <div class="col-md-6">
                <div class="form-group">
                    <select class="form-control select2">
                        <option value="">Filter by state</option>
                        <option value="AK">Alaska</option>
                        <option value="AL">Alabama</option>
                        <option value="AR">Arkansas</option>
                        <option value="AZ">Arizona</option>
                        <option value="CA">California</option>
                        <option value="CO">Colorado</option>
                        <option value="CT">Connecticut</option>
                        <option value="DE">Delaware</option>
                        <option value="FL">Florida</option>
                        <option value="GA">Georgia</option>
                        <option value="HI">Hawaii</option>
                        <option value="ID">Idaho</option>
                        <option value="IL">Illinois</option>
                        <option value="IN">Indiana</option>
                        <option value="IA">Iowa</option>
                        <option value="ME">Maine</option>
                        <option value="MD">Maryland</option>
                        <option value="MA">Massachusetts</option>
                        <option value="MI">Michigan</option>
                        <option value="MT">Montana</option>
                        <option value="NH">New Hampshire</option>
                        <option value="NJ">New Jersey</option>
                        <option value="NY">New York</option>
                        <option value="NE">Nebraska</option>
                        <option value="NV">Nevada</option>
                        <option value="NM">New Mexico</option>
                        <option value="ND">North Dakota</option>
                        <option value="NC">North Carolina</option>
                        <option value="KS">Kansas</option>
                        <option value="KY">Kentucky</option>
                        <option value="LA">Louisiana</option>
                        <option value="MN">Minnesota</option>
                        <option value="MS">Mississippi</option>
                        <option value="MO">Missouri</option>
                        <option value="OH">Ohio</option>
                        <option value="OK">Oklahoma</option>
                        <option value="OR">Oregon</option>
                        <option value="UT">Utah</option>
                        <option value="SD">South Dakota</option>
                        <option value="SC">South Carolina</option>
                        <option value="TX">Texas</option>
                        <option value="TN">Tennessee</option>
                        <option value="PA">Pennsylvania</option>
                        <option value="RI">Rhode Island</option>
                        <option value="VT">Vermont</option>
                        <option value="VA">Virginia</option>
                        <option value="WA">Washington</option>
                        <option value="WI">Wisconsin</option>
                        <option value="WV">West Virginia</option>
                        <option value="WY">Wyoming</option>
                    </select>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group">
                    <select class="form-control select2">
                        <option value="">Filter by user group</option>
                        <option value="admins">Administrators</option>
                        <option value="members">Members</option>
                        <option value="publishers">Publishers</option>
                        <option value="advertisers">Advertisers</option>
                    </select>
                </div>
            </div>
            </div>

            <button type="submit" class="btn btn-primary pull-right">Filter Results</button>
            <div class="checkbox">
                <label>
                    <input type="checkbox"> Include a radius search
                </label>
            </div>
        </form>
    </div>
</div>

<!-- CONTENT -->
<div class="main-content">
    <div class="row">
        <div class="col-md-12">
            <h3>Users</h3>
            <table class="table table-hover table-striped">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Member Since</th>
                    <th>Email</th>
                    <th>Earnings</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="table-preview">
                        <img alt="" src="img/users/luke.jpg" class="img-circle avatar">
                        <a href="#" class="name">Sylvia Stingray</a>
                        <span class="subtext">Web Developer</span>
                    </td>
                    <td>Feb 02, 2013</td>
                    <td><a href="#">sylvia.stingray@example.com</a></td>
                    <td>$10,532.00</td>
                    <td class="actions">
                        <a href="#"><i class="fa fa-pencil"></i></a>
                        <a href="#"><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                <tr>
                    <td class="table-preview">
                        <img alt="" src="img/users/alex.jpg" class="img-circle avatar">
                        <a href="#" class="name">Jennifer Garner</a>
                        <span class="subtext">Project Manager</span>
                    </td>
                    <td>Feb 02, 2013</td>
                    <td><a href="#">jennifer.garner@example.com</a></td>
                    <td>$16,262.00</td>
                    <td class="actions">
                        <a href="#"><i class="fa fa-pencil"></i></a>
                        <a href="#"><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                <tr>
                    <td class="table-preview">
                        <img alt="" src="img/users/lisa.jpg" class="img-circle avatar">
                        <a href="#" class="name">Wilma Penaflor</a>
                        <span class="subtext">Graphic Designer</span>
                    </td>
                    <td>Feb 02, 2013</td>
                    <td><a href="#">wilma.penaflor@example.com</a></td>
                    <td>$27,579.00</td>
                    <td class="actions">
                        <a href="#"><i class="fa fa-pencil"></i></a>
                        <a href="#"><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                <tr>
                    <td class="table-preview">
                        <img alt="" src="img/users/mike.jpg" class="img-circle avatar">
                        <a href="#" class="name">Richard Leigh</a>
                        <span class="subtext">Managing Partner</span>
                    </td>
                    <td>Feb 02, 2013</td>
                    <td><a href="#">richard.leigh@example.com</a></td>
                    <td>$17,841.00</td>
                    <td class="actions">
                        <a href="#"><i class="fa fa-pencil"></i></a>
                        <a href="#"><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                <tr>
                    <td class="table-preview">
                        <img alt="" src="img/users/lex.jpg" class="img-circle avatar">
                        <a href="#" class="name">Cori Bradley</a>
                        <span class="subtext">Accounting</span>
                    </td>
                    <td>Feb 02, 2013</td>
                    <td><a href="#">cori.bradley@example.com</a></td>
                    <td>$31,012.00</td>
                    <td class="actions">
                        <a href="#"><i class="fa fa-pencil"></i></a>
                        <a href="#"><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                <tr>
                    <td class="table-preview">
                        <img alt="" src="img/users/fabbian.jpg" class="img-circle avatar">
                        <a href="#" class="name">Roy Brookins</a>
                        <span class="subtext">Marketing</span>
                    </td>
                    <td>Feb 02, 2013</td>
                    <td><a href="#">roy.brookins@example.com</a></td>
                    <td>$13,886.00</td>
                    <td class="actions">
                        <a href="#"><i class="fa fa-pencil"></i></a>
                        <a href="#"><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                <tr>
                    <td class="table-preview">
                        <img alt="" src="img/users/molly.jpg" class="img-circle avatar">
                        <a href="#" class="name">Brenda McConnell</a>
                        <span class="subtext">Team Lead</span>
                    </td>
                    <td>Feb 02, 2013</td>
                    <td><a href="#">brenda.mcconnell@example.com</a></td>
                    <td>$5,500.00</td>
                    <td class="actions">
                        <a href="#"><i class="fa fa-pencil"></i></a>
                        <a href="#"><i class="fa fa-times"></i></a>
                    </td>
                </tr>
                </tbody>
            </table>
            <ul class="pagination pagination-sm">
                <li class="disabled"><a href="#">&laquo;</a></li>
                <li class="active"><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li><a href="#">&raquo;</a></li>
            </ul>
        </div>
    </div>
</div>
<!-- END: CONTENT -->
                </section>
            </div>
            <!-- END: BODY -->