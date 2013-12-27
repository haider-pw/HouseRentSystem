<footer>
    <div class="container">
        <div class="row">
            <div class="span4">
                <ul class="social">
                    <li><a href="http://www.facebook.com/pages/Telic-Technologies-Pvt-Ltd/329268337107595" class="facebook" target="_blank">Facebook</a></li>
                    <li><a href="https://twitter.com/telictech" class="twitter" target="_blank">Twitter</a></li>
                    <li><a href="https://plus.google.com/?partnerid=gplp0" class="google" target="_blank">Google +</a></li>
                    <li><a href="http://pk.linkedin.com/in/telictechnologies" class="linkedin" target="_blank">LinkedIn</a></li>
                    <li><a href="http://www.flickr.com/photos/telictech/" class="flickr" target="_blank">Flickr</a></li>
                    <li><a href="http://dribbble.com/telictech" class="dribbble" target="_blank">Dribbble</a></li>
                </ul>
            </div>
            <div class="span8">
                <nav>
                    <ul>
                        <li class="current">
                            <a href="index.html">Home</a>
                        </li>
                        <li>
                            <a href="about.html">About Us</a>
                        </li>
                        <li>
                            <a href="services.html">Services</a>
                        </li>
                        <li>
                            <a href="our-team.html">Our Team</a>
                        </li>



                        <li>
                            <a href="portfolio-videos.html">Portfolio</a>
                        </li>

                        <li>
                            <a href="clients.html">Clients</a>
                        </li>

                        <li>
                            <a href="blog.html">Blog</a>
                        </li>

                        <li>
                            <a href="contact.html">Contact</a>
                        </li>
                    </ul>
                    <select class="mobile-nav"><option value="">Navigate to...</option><option value="index.html"> Home</option><option value="about.html"> About Us</option><option value="services.html"> Services</option><option value="portfolio-videos.html"> Portfolio</option><option value="clients.html"> Clients</option><option value="blog.html"> Blog</option><option value="contact.html"> Contact</option></select></nav>
                <div class="address">
                    <p><i class="icon-home"></i> FF-233 Deans Trade Center Peshawar, KPK, Pakistan, <i class="icon-phone"></i> +92(91) 560 3113, <i class="icon-envelope-alt"></i>info@telictech.com</p>
                </div>
            </div>
        </div>
    </div>
</footer>
<div id="copyright">
    <div class="container">
        <div id="copy-left">
            <p>Copyright &copy; 2012 Telic Technologies (Pvt.) Ltd</p>
        </div>
        <nav>
            <ul>
                <li class="current">
                    <a href="#">All rights Reserved</a>
                </li>
                <li>
                    <a href="#">Terms</a>
                </li>
            </ul>
            <select class="mobile-nav"><option value="">Navigate to...</option><option value="index.html"> Home</option><option value="about.html"> About Us</option><option value="services.html"> Services</option><option value="portfolio-videos.html"> Portfolio</option><option value="clients.html"> Clients</option><option value="blog.html"> Blog</option><option value="contact.html"> Contact</option></select></nav>
    </div>
</div>

<!--  JQuery Latest  -->
<script src="{{base_url()}}styles/js/jQuery_v1.10.2.js" type="text/javascript"></script>
<!--  BootStrap JS Files  -->
<script src="{{base_url()}}styles/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

{{if $Fetch.Method == "index" }}
<script type="text/javascript" src="{{base_url()}}styles/js/jQuery.cslider.js"></script>
<script type="text/javascript" src="{{base_url()}}styles/js/modernizr.custom.28468.js"></script>
<!-- End WOWSlider.com BODY section -->
{{/if}}
{{literal}}
<script>
    var _gaq=[['_setAccount','UA-XXXXX-X'],['_trackPageview']];
    (function(d,t){var g=d.createElement(t),s=d.getElementsByTagName(t)[0];
        g.src='//www.google-analytics.com/ga.js';
        s.parentNode.insertBefore(g,s)}(document,'script'));
</script>
<script type="text/javascript">
        $(function() {
            $('#da-slider').cslider();
        });
</script>
{{/literal}}
</body>
</html>
