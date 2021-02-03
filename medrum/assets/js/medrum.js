$(document).ready(function(){

    // const menuBtn = document.querySelector('.menu-btn');
    // menuBtn.addEventListener('click', () => {
    //     if(!menuOpen) {
    //         menuBtn.classList.add('open');
    //         menuOpen = true;
    //     } else {
    //         menuBtn.classList.remove('open');
    //         menuOpen = false;
    //     }
    // });
    let menuOpen = false;
    $('.menu-btn').click(function(){
        if (!menuOpen){
            $(this).addClass('open');
            $('body').css('overflow' , 'hidden');
            $('.nav').slideDown(500, function (){$(this).css('display', 'flex')});
            menuOpen = true;
        } else {
            $(this).removeClass('open');
            $('.nav').slideUp(500);
            setTimeout(function(){$('body').css('overflow' , 'auto')},500);
            menuOpen = false;
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
    let width = $('body').innerWidth();

    function LocationHref(width) {
        if (hreflocal.lastIndexOf("services") >= 1 && width > 768)  {
            $('.services').addClass('nav-item-active');
        } else if (hreflocal.lastIndexOf("debtors") >= 1 && width > 768) {
            $('.debtors').addClass('nav-item-active');
        } else if (hreflocal.lastIndexOf("aboutus") >= 1 && width > 768) {
            $('.aboutus').addClass('nav-item-active');
        } else if (hreflocal.lastIndexOf("contacts") >= 1 && width > 768) {
            $('.contacts').addClass('nav-item-active');
        } else if (width > 768) {
            $('.index').addClass('nav-item-active');
        } else {
            $('div').removeClass('nav-item-active');
        }
    }

    LocationHref(width);

    /* End if */
    const time = 1;
    function timer(value){
        return setTimeout(function() {
            const newTime = value + 1;
            if(newTime != 0) timer();
        }, 1000);;
    }

    $('.text-copy').click(function(){
        $('.message').remove();
        const text = $(this).text();
        const $temp = $("<input>");
        $("body").append($temp);
        $temp.val($(this).text()).select();
        document.execCommand("copy");
        $temp.remove();
        $('.container-main-debtors').append('<div class="message"><div class="message-header"><p>Сообщение</p><p>'+ timer(1) +' назад</p><span class="message-close">x</span></div><div class="message-content">'+ text +'</div><div class="message-info">Вы успешно скопировали</div></div>');

        $('.message-close').click(function(){
            $('.message').remove();
        })
    });

    setTimeout(function(){
        $(".message").remove();
    }, 10000);

    $('form').submit(function(){
        $(this).delay(500).fadeOut(1000);
        $(this).animate({ "opacity" : "0", },{ "complete" : function() { $(this).remove(); } });
        $('#callbackForm_forms_flash').delay(1500).fadeIn(500);
    });

    $("#phone").mask("+7 (999) 999-99-99");

});