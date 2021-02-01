$(document).ready(function(){
    $('#checkbox').on('click', function () {
        if ( $(this).is(':checked') ) {
            $('#butdis').attr('disabled', false);
        } else {
            $('#butdis').attr('disabled', true);
        }
    });

    // const counter = document.querySelector(".counter");
    // let count = 0;
    // setInterval(() => {
    //     if(count == 92) {
    //         clearInterval(count);
    //     }else {
    //         count+=1;
    //         counter.textContent = count + "%";
    //     }
    // }, 42);

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

    /* End if */

    $('.text-copy').click(function(){
        $('.message').remove();
        const text = $(this).text();
        const $temp = $("<input>");
        $("body").append($temp);
        $temp.val($(this).text()).select();
        document.execCommand("copy");
        $temp.remove();
        $('.container-main-debtors').append('<div class="message"><div class="message-header"><p>Сообщение</p><p>1с. назад</p><span class="message-close">x</span></div><div class="message-content">'+ text +'</div><div class="message-info">Вы успешно скопировали</div></div>');

        $('.message-close').click(function(){
            $('.message').remove();
        })
    });



});