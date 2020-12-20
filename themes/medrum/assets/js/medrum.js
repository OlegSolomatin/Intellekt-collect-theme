$(document).ready(function(){
    $('#checkbox').on('click', function () {
        if ( $(this).is(':checked') ) {
            $('#butdis').attr('disabled', false);
        } else {
            $('#butdis').attr('disabled', true);
        }
    });

    ymaps.ready(init);
    function init(){
        var myMap = new ymaps.Map("map",{center: [55.75985606898725,37.61054750000002],zoom: 12});
        myMap.controls.add("zoomControl").add("typeSelector").add("mapTools");
        var myPlacemark = new ymaps.Placemark([55.75985606898725,37.61054750000002]);
        myMap.geoObjects.add(myPlacemark);
    }

});