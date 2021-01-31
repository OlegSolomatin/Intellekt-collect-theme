$(document).ready(function(){
    $('#checkbox').on('click', function () {
        if ( $(this).is(':checked') ) {
            $('#butdis').attr('disabled', false);
        } else {
            $('#butdis').attr('disabled', true);
        }
    });

    /* При добавлении новой страницы в CMS необходимо назначить класс, и добавить подсвет через IF ниже*/

    let hreflocal = window.location.pathname;

    function LocationHref() {
        if (hreflocal.lastIndexOf("services") >= 1)  {
            $('.services').addClass('nav-item-active');
        } else if (hreflocal.lastIndexOf("debtors") >= 1) {
            $('.debtors').addClass('nav-item-active');
        } else if (hreflocal.lastIndexOf("aboutus") >= 1) {
            $('.aboutus').addClass('nav-item-active');
        } else if (hreflocal.lastIndexOf("contacts") >= 1) {
            $('.contacts').addClass('nav-item-active');
        }else {
            $('.index').addClass('nav-item-active');
        }
    }

    LocationHref();

    //console.log(hreflocal);

    /* End if */

});