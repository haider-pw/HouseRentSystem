{{if LoggedIn()}}

    <div class="user-box navbar-right">
        <div class="user-id">
            <img class="user-picture"
                 src="{{$UserProfileImage}}"/>

            <div class="user-name">
                {{$this->session->userdata('FullName')}}
            </div>
            <div class="dropdown-arrow"></div>
            <div class="dropdown-menu">
                <ul>
                    <li>Settings</li>
                    <li id="adminPanelRequest">Administration</li>
                    <li onclick="logout()">Log Out</li>
                </ul>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        function logout() {
            $.ajax({
                type: "POST",
                url: "{{url}}user_management/userLogin/logout",
                data: "sourcePage={{url type='current'}}",
                success: function output(e){
                    if(e=='true'){
                        location.reload();
                    }
                }
            });
        }

        $('#adminPanelRequest').on('click',function(){
            var pathToRedirect = "{{userLoggedInRedirectPath($UserGroupID)}}";
            window.location.href = "{{url}}" + pathToRedirect;
        });
    </script>
{{else}}
    <form class="navbar-form navbar-right" method="post" action="{{url}}user_management/userLogin/login">
        <input type="hidden" value="{{url type="current"}}" name="sourcePage">

        <div class="form-group">
            <input type="text" placeholder="Username or Email" id="Username" name="Username" class="form-control">
        </div>
        <div class="form-group">
            <input type="password" placeholder="Password" id="Password" name="Password" class="form-control">
        </div>
        <button type="submit" class="btn btn-success">Sign in</button>
    </form>
{{/if}}
