var geocoder;
var map;
var mapOptions;
var newLatLng;
var newLat;
var newLng;
var latlng;

function initialize() {
  geocoder = new google.maps.Geocoder();
  var userBlock = document.querySelector('.content');
  zipcode = userBlock.attributes[1].value;
  geocoder.geocode({'address': zipcode}, function(results, status){
    if(status == google.maps.GeocoderStatus.OK) {
      console.log("before map render")
      newLatLng = results[0].geometry.location;
      newLat = (newLatLng["k"]);
      newLng = (newLatLng["D"]);
      latlng = new google.maps.LatLng(newLat, newLng);
      var mapOptions = {
        zoom: 13,
        center: latlng
      }
      map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
      var marker = new google.maps.Marker({
        map: map,
        position: results[0].geometry.location
      });

      var request = {
        location: latlng,
        radius: '2000',
        types: ['park']
      }
      console.log("before places search");
      var service =  new google.maps.places.PlacesService(map);
      service.nearbySearch(request, callback);
    } else {
      console.log("Geocode was not successful for the following reason: " + status);
    };

    console.log("Before end of geocode call");
  });

  console.log("After geocode call");
}

function callback(results, status){
  console.log(results);
  if(status == google.maps.places.PlacesServiceStatus.OK){
    for(var i= 0; i< results.length; i++){
      console.log(results[i]);
      var place = results[i];
      createMarker(results[i]);
    }
  }
}

function createMarker(results){
  var marker = new google.maps.Marker({
    map: map,
    position: results.geometry.location
  });
}


$('document').ready(function(){
  google.maps.event.addDomListener(window, 'load', initialize);
});
