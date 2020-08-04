<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.*" %>
<%@page import="org.apache.ibatis.session.SqlSessionFactory" %>
<%@page import="org.apache.ibatis.session.SqlSession"%>

<%@page import="com.ondongne.dto.DataTransferCircle" %>
<%@page import="com.ondongne.dto.DataTransferCircleJoin" %>

<%
	List<DataTransferCircle> joinCircleList = (List<DataTransferCircle>)request.getAttribute("circleList");
%>

<!DOCTYPE html>
<html ng-app="StarterApp">
  <head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <title>ON동네 - 마이페이지</title>

    <!--SideNav-->
    <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/angular_material/0.8.3/angular-material.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>
    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <!-- Material Design Bootstrap -->
    <link href="css/mdb.min.css" rel="stylesheet"/>
    <!-- Your custom styles (optional) -->
    <link href="css/style.min.css" rel="stylesheet"/>    

    <!-- Modal scrolling place -->
    <style>
        .modal-open .navbar-expand-lg {
            padding-right: 16px !important;
        }
    </style>

    <!-- google map css -->
    <style>
        .map-container{
            overflow:hidden;
            padding-bottom:56.25%;
            position:relative;
            height:0;
        }
        .map-container iframe{
            left:0;
            top:0;
            height:100%;
            width:100%;
            position:absolute;
        }
        .avatar-pic {
            width: 150px;
        }
        #profile_photo{
            width:200px;
            height:200px;
        }
    </style>
  </head>

  <body class="grey lighten-3">

    <!-- Header Start -->
    <header>
        <!-- Navbar signin form -->
        <%-- <% if (session.getAttribute("email") != null) {%> --%>
        <jsp:include page="navbar_signon.jsp"/>
        <%-- <%} else {%>
            <jsp:include page="navbar_signin.jsp"/>
        <%} %> --%>

    <!--Side Nav-->
    <div class="sidebar-fixed position-fixed">
    <md-sidenav layout="column" class="md-sidenav-left md-whiteframe-z2" md-component-id="left" md-is-locked-open="$mdMedia('gt-md')" >
      <md-toolbar class="md-tall md-hue-2">
        <span flex></span>
        <div layout="column" class="md-toolbar-tools-bottom inset">
          <user-avatar></user-avatar>
          <span></span>
          <div>내동네(주소)</div>
          <div><%= session.getAttribute("email") %></div>
        </div>
      </md-toolbar>
      <md-list role="list">
        <a href="signupsub.users">
            <md-item-content md-ink-ripple layout="row" layout-align="start center" class="md-ink-ripple layout-align-start-center layout-row" >
            <div class="inset">
                <ng-md-icon icon="message">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"></path></svg>
                </ng-md-icon>
            </div>
            <div class="inset ng-binding">개인정보수정</div>
            </md-item-content>
        </a>
        
        <a href="">
            <md-item-content md-ink-ripple layout="row" layout-align="start center" class="md-ink-ripple layout-align-start-center layout-row">
            <div class="inset">
                <ng-md-icon icon="message">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"></path></svg>
                </ng-md-icon>
            </div>
            <div class="inset ng-binding">followers</div>
            </md-item-content>
        </a>
        
        <a href="">
            <md-item-content md-ink-ripple layout="row" layout-align="start center" class="md-ink-ripple layout-align-start-center layout-row">
            <div class="inset">
                <ng-md-icon icon="message">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"></path></svg>
                </ng-md-icon>
            </div>
            <div class="inset ng-binding">following</div>
            </md-item-content>
        </a>
        
        <a href="" data-toggle="modal" data-target="#modalConfirmDelete">
            <md-item-content md-ink-ripple layout="row" layout-align="start center" class="md-ink-ripple layout-align-start-center layout-row">
            <div class="inset">
                <ng-md-icon icon="message">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M20 2H4c-1.1 0-1.99.9-1.99 2L2 22l4-4h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-2 12H6v-2h12v2zm0-3H6V9h12v2zm0-3H6V6h12v2z"></path></svg>
                </ng-md-icon>
            </div>
            <div class="inset ng-binding">탈퇴하기</div>
            </md-item-content>
        </a>
      </md-list>
    </md-sidenav>
    </div>
    <!--/.SideNav-->
    </header>

    <!--Modal: 회원탈퇴 확인창-->
    <div class="modal fade" id="modalConfirmDelete" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-md modal-notify modal-danger" role="document">
            <!--Content-->
            <div class="modal-content">
                <form action="delete.users" method="POST">
                    <!--Header-->
                    <div class="modal-header d-flex justify-content-center">
                        <p class="heading">ON동네 탈퇴</p>
                    </div>

                    <!--Body-->
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-3">
                                <p></p>
                                <p class="text-center"><i class="fas fa-times fa-4x animated rotateIn"></i></p>
                            </div>

                            <div class="col-9">
                                <p>ON동네 서비스를 정말로 탈퇴하시겠습니까?</p>
                                <p>탈퇴를 위해 계정 비밀번호를 입력해주세요.</p>
                                <div class="md-form">
                                    <i class="fas fa-lock prefix"></i>
                                    <input type="password" id="inputValidationEx2" name="confirmPassword" class="form-control validate"/>
                                    <label for="inputValidationEx2" data-error="wrong" data-success="right">비밀번호 입력</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--Footer-->
                    <div class="modal-footer flex-center">
                        <button class="btn btn-outline-danger" type="submit">탈퇴</button>
                        <a type="button" class="btn  btn-danger waves-effect" data-dismiss="modal">취소</a>
                    </div>
                </form>
            </div>
            <!--/.Content-->
        </div>
    </div>
    <!--Modal: modalConfirmDelete-->

    <!-- Main Start -->
        <main style="padding-left:300px;">
            <div class="container mt-5">

                <!-- Heading -->
                <div class="card mb-4 wow fadeIn">
                    <!--Card content-->
                    <div class="card-body d-sm-flex justify-content-between">
                        <h4 class="mb-2 mb-sm-0 pt-1">
                            <a href="https://mdbootstrap.com/docs/jquery/" target="_blank">Home Page</a>
                            <span>/</span>
                            <a href="https://mdbootstrap.com/docs/jquery/" target="_blank">Dashboard</a>
                        </h4>

                        <form class="d-flex justify-content-center">
                            <!-- Default input -->
                            <input type="search" placeholder="search" aria-label="Search" class="form-control"/>
                            <button class="btn btn-primary btn-sm my-0 p" type="submit">
                                <i class="fas fa-search"></i>
                            </button>
                        </form>
                    </div>
                </div>
                <!-- Heading -->

                <!--Grid row-->
                <div class="row wow fadeIn">
                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <!--Card(스크랩명소)-->
                        <div class="card mb-4">
                            <!-- Card header -->
                            <div class="card-header">스크랩명소</div>
                            <!--Card content-->
                            <div class="card-body">
                                <!--Google map-->
                                <div id="map-container-google-2" class="z-depth-1-half map-container" style="height: 500px">
                                    <iframe src="https://maps.google.com/maps?q=chicago&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0"
                                    style="border:0" allowfullscreen></iframe>
                                </div>
                                <!--Google Maps-->
                            </div>
                            <!--Card content-->
                        </div>
                        <!--/.Card-->
                    </div>
                    <!--/.Grid column-->

                    <!--Grid column-->
                    <div class="col-md-6 mb-4">
                        <!--Card(달력)-->
                        <div class="card mb-4">
                            <!-- Card header -->
                            <div class="card-header text-center">달력</div>
                            <!--Card content-->
                            	<div class="card-body">
                               	 <!-- TODO : 달력 -->
                            </div>
                        </div>
                        <!--/.Card-->
                    </div>
                    <!--/. Grid column-->
               

               
                </div>
                <!--Grid column-->
            </div>

            <!--test table-->
            <table class="table table-hover" style="padding-left:300px;">
	            <thead>
	                <tr>
	                <th scope="col">NO.</th>
	                <th scope="col">글제목</th>
	                <th scope="col">작성자</th>
	                <th scope="col">모임날짜</th>
	                </tr>
	            </thead>
	            <tbody>
                
	                <%
	                	for (int i=0;i<joinCircleList.size();i++){
	                %>
	                	<tr>
	                		<td><%=i+1 %></td>
	                		<th><%=joinCircleList.get(i).getTitle()%></th>
	                		<td><%=joinCircleList.get(i).getEmail() %></td>
	                		<td><%=joinCircleList.get(i).getEvent_date() %></td>
	                	</tr>
	                	<%
	                	}
	                	%>
	            </tbody>
            </table>
            <!--/. test table-->
        
        </main>
        <!-- Main End -->
        <footer>
        <!-- Footer import -->
        <%@ include file="footer.jsp" %>
        </footer>

        <!-- SCRIPTS -->
        <!-- JQuery -->
        <script type="text/javascript" src="js/jquery-3.4.1.min.js"></script>
        <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> -->
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="js/popper.min.js"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="js/bootstrap.min.js"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Initializations -->
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();
        </script>

    <!-- Angular Material Dependencies -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular-animate.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.3.14/angular-aria.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-material/1.0.5/angular-material.js"></script>
    
    <script src="https://cdn.jsdelivr.net/angular-material-icons/0.4.0/angular-material-icons.min.js"></script> 
  </body>

  
<!--SideNav-->
<style>
    $gray: #ededed;

    md-content.md-default-theme {
    background-color: $gray;
    }
    md-divider{
    color: $gray;
    }
    md-card {
    background-color: #fff;
    h2:first-of-type {
        margin-top: 0;
    }
    }
    md-toolbar {
    .md-button.md-default-theme {
        border-radius: 99%; // round toolbar buttons
    }
    }
    h2 {
    font-weight: 400;
    }
    .md-toolbar-tools-bottom {
    font-size: small;
    & :last-child {
        opacity: 0.8;
    }
    }
    md-toolbar:not(.md-hue-1),
    .md-fab {
    fill: #fff;
    }
    md-sidenav {
    fill: #737373;
    ng-md-icon {
        position: relative;
        top: 5px; // adjust for svg viewbox
    }
    }
    .user-avatar {
    border-radius: 99%;
    }
</style>

<!--SideNav-->
<script>
    var app = angular.module('StarterApp', ['ngMaterial', 'ngMdIcons']);

    app.controller('AppCtrl', ['$scope', '$mdBottomSheet', '$mdSidenav', '$mdDialog', function($scope, $mdBottomSheet, $mdSidenav, $mdDialog) {
    $scope.toggleSidenav = function(menuId) {
        $mdSidenav(menuId).toggle();
    };
    $scope.sections = [{
            name: 'Getting Started',
            state: 'home.gettingstarted',
            type: 'link'
            }];

            $scope.sections.push({
            name: 'Beers',
            type: 'toggle',
            pages: [{
                name: 'IPAs',
                type: 'link',
                state: 'home.beers.ipas',
                icon: 'fa fa-group'
            }, {
                name: 'Porters',
                state: 'home.beers.porters',
                type: 'link',
                icon: 'fa fa-map-marker'
            },
                {
                name: 'Wheat',
                state: 'home.beers.wheat',
                type: 'link',
                icon: 'fa fa-plus'
                }]
            });

            $scope.sections.push({
            name: 'Munchies',
            type: 'toggle',
            pages: [{
                name: 'Cheetos',
                type: 'link',
                state: 'munchies.cheetos',
                icon: 'fa fa-group'
            }, {
                name: 'Banana Chips',
                state: 'munchies.bananachips',
                type: 'link',
                icon: 'fa fa-map-marker'
            },
                {
                name: 'Donuts',
                state: 'munchies.donuts',
                type: 'link',
                icon: 'fa fa-map-marker'
                }]
            });
    $scope.menu = [{
        link: '',
        title: 'Dashboard',
        icon: 'dashboard',
        submenu: [
        {
            link: '',
            title: 'd1',
            icon: 'd1'
        },
        {
            link: '',
            title: 'd2',
            icon: 'd2'
        },{
            link: '',
            title: 'd3',
            icon: 'd3'
        },{
            link: '',
            title: 'd4',
            icon: 'd4'
        }
        ]
    }, {
        link: '',
        title: 'Friends',
        icon: 'group'
    }, {
        link: '',
        title: 'Messages',
        icon: 'message'
    }];
    $scope.admin = [{
        link: '',
        title: 'Trash',
        icon: 'delete'
    }, {
        link: 'showListBottomSheet($event)',
        title: 'Settings',
        icon: 'settings'
    }];
    $scope.activity = [{
        what: 'Brunch this weekend?',
        who: 'Ali Conners',
        when: '3:08PM',
        notes: " I'll be in your neighborhood doing errands"
    }, {
        what: 'Summer BBQ',
        who: 'to Alex, Scott, Jennifer',
        when: '3:08PM',
        notes: "Wish I could come out but I'm out of town this weekend"
    }, {
        what: 'Oui Oui',
        who: 'Sandra Adams',
        when: '3:08PM',
        notes: "Do you have Paris recommendations? Have you ever been?"
    }, {
        what: 'Birthday Gift',
        who: 'Trevor Hansen',
        when: '3:08PM',
        notes: "Have any ideas of what we should get Heidi for her birthday?"
    }, {
        what: 'Recipe to try',
        who: 'Brian Holt',
        when: '3:08PM',
        notes: "We should eat this: Grapefruit, Squash, Corn, and Tomatillo tacos"
    }, ];
    $scope.alert = '';
    $scope.showListBottomSheet = function($event) {
        $scope.alert = '';
        $mdBottomSheet.show({
        template: '<md-bottom-sheet class="md-list md-has-header"> <md-subheader>Settings</md-subheader> <md-list> <md-item ng-repeat="item in items"><md-item-content md-ink-ripple flex class="inset"> <a flex aria-label="{{item.name}}" ng-click="listItemClick($index)"> <span class="md-inline-list-icon-label">{{ item.name }}</span> </a></md-item-content> </md-item> </md-list></md-bottom-sheet>',
        controller: 'ListBottomSheetCtrl',
        targetEvent: $event
        }).then(function(clickedItem) {
        $scope.alert = clickedItem.name + ' clicked!';
        });
    };

    $scope.showAdd = function(ev) {
        $mdDialog.show({
            controller: DialogController,
            template: '<md-dialog aria-label="Mango (Fruit)"> <md-content class="md-padding"> <form name="userForm"> <div layout layout-sm="column"> <md-input-container flex> <label>First Name</label> <input ng-model="user.firstName" placeholder="Placeholder text"> </md-input-container> <md-input-container flex> <label>Last Name</label> <input ng-model="theMax"> </md-input-container> </div> <md-input-container flex> <label>Address</label> <input ng-model="user.address"> </md-input-container> <div layout layout-sm="column"> <md-input-container flex> <label>City</label> <input ng-model="user.city"> </md-input-container> <md-input-container flex> <label>State</label> <input ng-model="user.state"> </md-input-container> <md-input-container flex> <label>Postal Code</label> <input ng-model="user.postalCode"> </md-input-container> </div> <md-input-container flex> <label>Biography</label> <textarea ng-model="user.biography" columns="1" md-maxlength="150"></textarea> </md-input-container> </form> </md-content> <div class="md-actions" layout="row"> <span flex></span> <md-button ng-click="answer(\'not useful\')"> Cancel </md-button> <md-button ng-click="answer(\'useful\')" class="md-primary"> Save </md-button> </div></md-dialog>',
            targetEvent: ev,
        })
        .then(function(answer) {
            $scope.alert = 'You said the information was "' + answer + '".';
        }, function() {
            $scope.alert = 'You cancelled the dialog.';
        });
    };
    }]);

    app.controller('ListBottomSheetCtrl', function($scope, $mdBottomSheet) {
    $scope.items = [{
        name: 'Share',
        icon: 'share'
    }, {
        name: 'Upload',
        icon: 'upload'
    }, {
        name: 'Copy',
        icon: 'copy'
    }, {
        name: 'Print this page',
        icon: 'print'
    }, ];

    $scope.listItemClick = function($index) {
        var clickedItem = $scope.items[$index];
        $mdBottomSheet.hide(clickedItem);
    };
    });

    function DialogController($scope, $mdDialog) {
    $scope.hide = function() {
        $mdDialog.hide();
    };
    $scope.cancel = function() {
        $mdDialog.cancel();
    };
    $scope.answer = function(answer) {
        $mdDialog.hide(answer);
    };
    };

    app.directive('userAvatar', function() {
    return {
        replace: true,
        template: '<svg class="user-avatar" viewBox="0 0 128 128" height="64" width="64" pointer-events="none" display="block" > <path fill="#FF8A80" d="M0 0h128v128H0z"/> <path fill="#FFE0B2" d="M36.3 94.8c6.4 7.3 16.2 12.1 27.3 12.4 10.7-.3 20.3-4.7 26.7-11.6l.2.1c-17-13.3-12.9-23.4-8.5-28.6 1.3-1.2 2.8-2.5 4.4-3.9l13.1-11c1.5-1.2 2.6-3 2.9-5.1.6-4.4-2.5-8.4-6.9-9.1-1.5-.2-3 0-4.3.6-.3-1.3-.4-2.7-1.6-3.5-1.4-.9-2.8-1.7-4.2-2.5-7.1-3.9-14.9-6.6-23-7.9-5.4-.9-11-1.2-16.1.7-3.3 1.2-6.1 3.2-8.7 5.6-1.3 1.2-2.5 2.4-3.7 3.7l-1.8 1.9c-.3.3-.5.6-.8.8-.1.1-.2 0-.4.2.1.2.1.5.1.6-1-.3-2.1-.4-3.2-.2-4.4.6-7.5 4.7-6.9 9.1.3 2.1 1.3 3.8 2.8 5.1l11 9.3c1.8 1.5 3.3 3.8 4.6 5.7 1.5 2.3 2.8 4.9 3.5 7.6 1.7 6.8-.8 13.4-5.4 18.4-.5.6-1.1 1-1.4 1.7-.2.6-.4 1.3-.6 2-.4 1.5-.5 3.1-.3 4.6.4 3.1 1.8 6.1 4.1 8.2 3.3 3 8 4 12.4 4.5 5.2.6 10.5.7 15.7.2 4.5-.4 9.1-1.2 13-3.4 5.6-3.1 9.6-8.9 10.5-15.2M76.4 46c.9 0 1.6.7 1.6 1.6 0 .9-.7 1.6-1.6 1.6-.9 0-1.6-.7-1.6-1.6-.1-.9.7-1.6 1.6-1.6zm-25.7 0c.9 0 1.6.7 1.6 1.6 0 .9-.7 1.6-1.6 1.6-.9 0-1.6-.7-1.6-1.6-.1-.9.7-1.6 1.6-1.6z"/> <path fill="#E0F7FA" d="M105.3 106.1c-.9-1.3-1.3-1.9-1.3-1.9l-.2-.3c-.6-.9-1.2-1.7-1.9-2.4-3.2-3.5-7.3-5.4-11.4-5.7 0 0 .1 0 .1.1l-.2-.1c-6.4 6.9-16 11.3-26.7 11.6-11.2-.3-21.1-5.1-27.5-12.6-.1.2-.2.4-.2.5-3.1.9-6 2.7-8.4 5.4l-.2.2s-.5.6-1.5 1.7c-.9 1.1-2.2 2.6-3.7 4.5-3.1 3.9-7.2 9.5-11.7 16.6-.9 1.4-1.7 2.8-2.6 4.3h109.6c-3.4-7.1-6.5-12.8-8.9-16.9-1.5-2.2-2.6-3.8-3.3-5z"/> <circle fill="#444" cx="76.3" cy="47.5" r="2"/> <circle fill="#444" cx="50.7" cy="47.6" r="2"/> <path fill="#444" d="M48.1 27.4c4.5 5.9 15.5 12.1 42.4 8.4-2.2-6.9-6.8-12.6-12.6-16.4C95.1 20.9 92 10 92 10c-1.4 5.5-11.1 4.4-11.1 4.4H62.1c-1.7-.1-3.4 0-5.2.3-12.8 1.8-22.6 11.1-25.7 22.9 10.6-1.9 15.3-7.6 16.9-10.2z"/> </svg>'
    };
    });

    app.config(function($mdThemingProvider) {
    var customBlueMap = $mdThemingProvider.extendPalette('light-blue', {
        'contrastDefaultColor': 'light',
        'contrastDarkColors': ['50'],
        '50': 'ffffff'
    });
    $mdThemingProvider.definePalette('customBlue', customBlueMap);
    $mdThemingProvider.theme('default')
        .primaryPalette('customBlue', {
        'default': '500',
        'hue-1': '50'
        })
        .accentPalette('pink');
    $mdThemingProvider.theme('input', 'default')
        .primaryPalette('grey')
    });
</script>

<!--Google Maps-->
        <script src="https://maps.google.com/maps/api/js"></script>
        <script>
            // Regular map
            function regular_map() {
                var var_location = new google.maps.LatLng(40.725118, -73.997699);

                var var_mapoptions = {
                    center: var_location,
                    zoom: 14
                };

                var var_map = new google.maps.Map(document.getElementById("map-container"), var_mapoptions);
                var var_marker = new google.maps.Marker({
                    position: var_location,
                    map: var_map,
                    title: "New York"
                });
            }
        </script>
        <script>
        <!-- SideNav -->
        $(document).ready(function() {
            // SideNav Button Initialization
            $(".button-collapse").sideNav({
                slim: true
            });
            // SideNav Scrollbar Initialization
            var sideNavScrollbar = document.querySelector('.custom-scrollbar');
            var ps = new PerfectScrollbar(sideNavScrollbar);
            })
        </script>
</html>