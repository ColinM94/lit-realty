<%@ include file="includes/header.jsp" %>

<shiro:user>
<div class="center">  
<!-- Slideshow container -->
    <div class="slideshow-container">
      <!-- Full-width images with number and caption text -->
      <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="images/properties/large/${property.photo}/${property.photo}.jpg" style="width:100%">
      </div>

      <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="images/properties/large/${property.photo}/${property.photo}${"-1"}.jpg" style="width:100%">
      </div>

      <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="images/properties/large/${property.photo}/${property.photo}${"-2"}.jpg" style="width:100%">
      </div>

      <!-- Next and previous buttons -->
      <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
      <a class="next" onclick="plusSlides(1)">&#10095;</a>
    </div>
    <br>

    <!-- The dots/circles -->
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(1)"></span> 
      <span class="dot" onclick="currentSlide(2)"></span> 
      <span class="dot" onclick="currentSlide(3)"></span> 
    </div>  
        
    <table>
        <tr><td><img id="berPic" src="images/BER/${property.berRating}.png"><td></tr>
        <tr><td>Street: ${property.street}</td></tr>
        <tr><td>City: ${property.city}</td></tr>
        <tr><td>Bedrooms: ${property.bedrooms}</td></tr>
        <tr><td>Bathrooms: ${property.bathrooms}</td></tr>
        <tr><td>Square Feet: ${property.squareFeet}</td></tr>
        <tr><td>Lot Size: ${property.lotSize}</td></tr>
        <tr><td>Price: &euro;${property.price}</td></tr>
        <tr><td>Date Added: ${property.dateAdded}</td></tr>
        <tr><td>${property.description}</td></tr>
    </table>                            
    <br>
    <div id="map"></div>
</div>
      
<script>
      var geocoder;
      var map;
      var address = "${property.street}, ${property.city}, Ireland";
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 8,
          center: {lat: -34.397, lng: 150.644}
        });
        geocoder = new google.maps.Geocoder();
        codeAddress(geocoder, map);
      }

      function codeAddress(geocoder, map) {
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            map.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: map,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBY8nFByZfjnw7TeSL15uUE2ZVS5B2oDDo&callback=initMap">
</script>
<script>
    // Handles property images slideshow.
    var slideIndex = 1;
    showSlides(slideIndex);

    // Next/previous controls
    function plusSlides(n) {
      showSlides(slideIndex += n);
    }

    // Thumbnail image controls
    function currentSlide(n) {
      showSlides(slideIndex = n);
    }

    function showSlides(n) {
      var i;
      var slides = document.getElementsByClassName("mySlides");
      var dots = document.getElementsByClassName("dot");
      if (n > slides.length) {slideIndex = 1} 
      if (n < 1) {slideIndex = slides.length}
      for (i = 0; i < slides.length; i++) {
          slides[i].style.display = "none"; 
      }
      for (i = 0; i < dots.length; i++) {
          dots[i].className = dots[i].className.replace(" active", "");
      }
      slides[slideIndex-1].style.display = "block"; 
      dots[slideIndex-1].className += " active";
    }
    </script>
</shiro:user>
    
<shiro:guest>
    <c:redirect url="index.jsp"/>
</shiro:guest>
<%@ include file="includes/footer.jsp" %>