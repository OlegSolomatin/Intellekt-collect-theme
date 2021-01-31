$(document).ready(function(){
    ymaps.ready(init);
    function init(){
        var myMap = new ymaps.Map("map",{center: [55.022479,82.913593],zoom: 12});
        myMap.controls.add("zoomControl");
        var myPlacemark = new ymaps.Placemark([55.022479,82.913593]);
        myMap.geoObjects.add(myPlacemark);
    }
});