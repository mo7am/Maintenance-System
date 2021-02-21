<%@page import="SE.Employee"%>
<!DOCTYPE html>

<%
     Employee emp= new Employee();
                             HttpSession obj=request.getSession();
                           emp =(Employee)  obj.getAttribute("User");
                           
                       String name = emp.getF_name()+" " + emp.getL_name();
    %>
<html lang="en-US">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Profile</title>
    <meta name="description" content="Creative CV is a HTML resume template for professionals. Built with Bootstrap 4, Now UI Kit and FontAwesome, this modern and responsive design template is perfect to showcase your portfolio, skils and experience."/>
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
    <link href="css11/aos.css" rel="stylesheet">
    <link href="css11/bootstrap.min.css" rel="stylesheet">
    <link href="styles11/main.css" rel="stylesheet">
  </head>
  <body id="top">
    <header>
      <div class="profile-page sidebar-collapse">
        <nav class="navbar navbar-expand-lg fixed-top navbar-transparent bg-primary" color-on-scroll="400">
          <div class="container">
            <div class="navbar-translate"><a class="navbar-brand" href="#" rel="tooltip"></a>
              <button class="navbar-toggler navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-bar bar1"></span><span class="navbar-toggler-bar bar2"></span><span class="navbar-toggler-bar bar3"></span></button>
            </div>
            <div class="collapse navbar-collapse justify-content-end" id="navigation">
           
            </div>
          </div>
        </nav>
      </div>
    </header>
    <div class="page-content">
      <div>
<div class="profile-page">
  <div class="wrapper">
    <div class="page-header page-header-small" filter-color="green">
      <div class="page-header-image" data-parallax="true" style="background-image: url('images11/cc-bg-1.jpg');"></div>
      <div class="container">
        <div class="content-center">
          <div class="cc-profile-image"><a href="#"><img src="images11/anthony.jpg" alt="Image"/></a></div>
          <div class="h2 title"><%= name %></div>
        
        </div>
      </div>
      <div class="section">
        <div class="container">
          <div class="button-container"><a class="btn btn-default btn-round btn-lg btn-icon" href="#" rel="tooltip" title="Follow me on Facebook"><i class="fa fa-facebook"></i></a><a class="btn btn-default btn-round btn-lg btn-icon" href="#" rel="tooltip" title="Follow me on Twitter"><i class="fa fa-twitter"></i></a><a class="btn btn-default btn-round btn-lg btn-icon" href="#" rel="tooltip" title="Follow me on Google+"><i class="fa fa-google-plus"></i></a><a class="btn btn-default btn-round btn-lg btn-icon" href="#" rel="tooltip" title="Follow me on Instagram"><i class="fa fa-instagram"></i></a></div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="section" id="about">
  <div class="container">
    <div class="card" data-aos="fade-up" data-aos-offset="10">
      <div class="row">
        <div class="col-lg-6 col-md-12">
            
          <div class="card-body">
               <form> 
            <div class="h4 mt-0 title">Basic Information</div>
           
  <div class="row">
              <div class="col-sm-4"><strong class="text-uppercase">First name</strong></div>
              <div class="col-sm-8"><input style="width: 500px" value=" <%= emp.getF_name()%> " id="fname"  type="text" name="Fname" disabled></div>
            </div>
            <div class="row mt-3">
              <div class="col-sm-4"><strong class="text-uppercase">Last name</strong></div>
              <div class="col-sm-8"><input style="width: 500px" value=" <%= emp.getL_name()%> " id="lname" type="text" name="Lname" disabled></div>
            </div>
            <div class="row mt-3">
              <div class="col-sm-4"><strong class="text-uppercase">Email:</strong></div>
              <div class="col-sm-8"><input style="width: 500px" value=" <%= emp.getEmail()%> " id="email" type="text" name="Email" disabled></div>
            </div>
            <div class="row mt-3">
              <div class="col-sm-4"><strong class="text-uppercase">Address:</strong></div>
              <div class="col-sm-8"><input style="width: 500px" value=" <%= emp.getAddresses()%> " id="address" type="text" name="Address" disabled></div>
            </div>
            <div class="row mt-3">
              <div class="col-sm-4"><strong class="text-uppercase">Phone:</strong></div>
              <div class="col-sm-8"><input style="width: 500px" value=" <%= emp.getPhones()%> " id="phone" type="text" name="Phone" disabled></div>
            </div>
            
            
          </div>
           
            <button onclick="change2()" type="submit" name="submit"  class="btn btn-default" >Update Profile</button>
             </form>
             <button onclick="change()" type="submit" name="submit"  class="btn btn-default" >Edit Profile</button>
        </div>
         
        <div class="col-lg-6 col-md-12">
          <div class="card-body">
            <div class="h4 mt-0 title"></div>
            <div class="row">
             
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

    <script>
        function change(){
        document.getElementById("fname").disabled = false;
        document.getElementById("lname").disabled = false;
        document.getElementById("email").disabled = false;
        document.getElementById("address").disabled = false;
        document.getElementById("phone").disabled = false;
        
    }
    
       function change2(){
        document.getElementById("fname").disabled = true;
        document.getElementById("lname").disabled = true;
        document.getElementById("email").disabled = true;
        document.getElementById("address").disabled = true;
        document.getElementById("phone").disabled = true;
        
    }
        </script>

<div class="section" id="contact">
  <div class="cc-contact-information" style="background-image: url('images11/staticmap.png');">
    <div class="container">
      <div class="cc-contact">
        <div class="row">
          <div class="col-md-9">
            <div class="card mb-0" data-aos="zoom-in">
              <div class="h4 text-center title">Contact Me</div>
              <div class="row">
                <div class="col-md-6">
                  <div class="card-body">
                    <form action="https://formspree.io/your@email.com" method="POST">
                      <div class="p pb-3"><strong>Feel free to contact me </strong></div>
                      <div class="row mb-3">
                        <div class="col">
                          <div class="input-group"><span class="input-group-addon"><i class="fa fa-user-circle"></i></span>
                            <input class="form-control" type="text" name="name" placeholder="Name" required="required"/>
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col">
                          <div class="input-group"><span class="input-group-addon"><i class="fa fa-file-text"></i></span>
                            <input class="form-control" type="text" name="Subject" placeholder="Subject" required="required"/>
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col">
                          <div class="input-group"><span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                            <input class="form-control" type="email" name="_replyto" placeholder="E-mail" required="required"/>
                          </div>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <div class="col">
                          <div class="form-group">
                            <textarea class="form-control" name="message" placeholder="Your Message" required="required"></textarea>
                          </div>
                        </div>
                      </div>
                      <div class="row">
                        <div class="col">
                          <button class="btn btn-primary" type="submit">Send</button>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
                <div class="col-md-6">
                  <div class="card-body">
                    <p class="mb-0"><strong>Address </strong></p>
                    <p class="pb-2">140, City Center, New York, U.S.A</p>
                    <p class="mb-0"><strong>Phone</strong></p>
                    <p class="pb-2">+1718-111-0011</p>
                    <p class="mb-0"><strong>Email</strong></p>
                    <p>anthony@company.com</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div></div>
    </div>
    <footer class="footer">
     
      <div class="text-center text-muted">
      </div>
    </footer>
    <script src="js11/core/jquery.3.2.1.min.js"></script>
    <script src="js11/core/popper.min.js"></script>
    <script src="js11/core/bootstrap.min.js"></script>
    <script src="js11/now-ui-kit.js?v=1.1.0"></script>
    <script src="js11/aos.js"></script>
    <script src="scripts11/main.js"></script>
  </body>
</html>