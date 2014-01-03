{{if LoggedIn()}}
    <script type="text/javascript">
        $('document').ready(function (e) {
            function logout() {
                $.ajax({
                    type: "POST",
                    url: "{{url}}user_management/userLogin/logout",
                    data: "JobID={{url type='current'}}"
                });
            }
        });
    </script>
    <div class="user-box navbar-right">
        <div class="user-id">
            <img class="user-picture"
                 src="https://fbcdn-profile-a.akamaihd.net/hprofile-ak-ash3/c34.34.432.432/s160x160/575695_10101114843671310_1323509961_n.jpg"/>

            <div class="user-name">
                Syed Haider Hassan
            </div>
            <div class="dropdown-arrow"></div>
            <div class="dropdown-menu">
                <ul>
                    <li>Settings</li>
                    <li>Sports</li>
                    <li onclick="logout()">Log Out</li>
                </ul>
            </div>
        </div>
    </div>
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