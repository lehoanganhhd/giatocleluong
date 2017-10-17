<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    int c = listItem != null ? listItem.Count : 0;
    int i = 0;
%>

<!-- Slider -->
<div style="display: table-cell; vertical-align: middle;">
    <%if (c > 0)
        {%>
    <style>
        .mySlides {
            display: none;
        }
        /* Fading animation */
        .fade-slide {
            -webkit-animation-name: fade;
            -webkit-animation-duration: 1.5s;
            animation-name: fade;
            animation-duration: 1.5s;
        }

        @-webkit-keyframes fade {
            from {
                opacity: .4;
            }

            to {
                opacity: 1;
            }
        }

        @keyframes fade {
            from {
                opacity: .4;
            }

            to {
                opacity: 1;
            }
        }
    </style>
    <div style="position: relative; z-index: 1; float: left;">
        <%for (i = 0; i < c; i++)
            {
                if (!string.IsNullOrEmpty(listItem[i].File))
                {
        %>
        <div class="mySlides fade-slide">
            <a href="<%=listItem[i].URL %>" title="<%=listItem[i].Name %>" style="position: relative; display: block;">
                <img src="<%=listItem[i].File.Replace("~/", "/") %>" alt="<%=listItem[i].Name %>" />
                <span style="position: absolute; bottom: 0; width: 100%; left: 0; background-color: #000; opacity: 0.6; padding: 5px 20px; color: #fff; font-weight: bold;"><%=listItem[i].Name %></span>
            </a>
        </div>
        <%}
            } %>
    </div>
    <%} %>
    <div style="position: absolute; z-index: 2;">
        <a href="#" title="" style="position: relative; display: block;">
            <img src="/Content/images/border-slide.png" alt="" />
        </a>
    </div>
    <script>
        var slideIndex = 0;
        var slides = document.getElementsByClassName("mySlides");
        showSlides();
        function showSlides() {
            var i;
            $(".mySlides").hide();
            slideIndex++;
            if (slideIndex > slides.length) { slideIndex = 1; }
            slides[slideIndex - 1].style.display = "block";
            setTimeout(showSlides, 4000);
        }
    </script>
</div>
<!-- End Slider -->
