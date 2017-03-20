var jsonLoader = undefined;

function addActiveClass() {
    $(this).parent().addClass('active').siblings().removeClass('active');
    var server = $('li.active a').text();
    $("#appname").text(server);
    if (jsonLoader !== undefined) {
        clearTimeout(jsonLoader);
    }
    jsonLoader = setInterval(function() {
        loadJason();
    }, 1000);
    function loadJason() {
        $.getJSON(('http://localhost:4567/' + server), function(data) {
            $(".box-requests").text(data.requests);
            $(".box-idle-workers").text(data.idle_workers);
            $(".box-requests-per-second").text(data.requests_per_second);
            $(".box-cpu").text(data.cpu);
            $(".load-number1").text(data.load_average1);
            $(".load-number2").text(data.load_average2);
            $(".load-number3").text(data.load_average3);
            $(".box-size-per-req").text(data.size_per_request);
            $(".box-title").text(data.size_title);
        });
    }
}

$("#servers li a").click(addActiveClass);

$("#domain-name-button").click(function() {
    var domain = $('#domain-name').val();
    $("#servers").append('<li><a href="#">' + domain + '</a></li>');
    $('#domain-name').val('');
    $( "#servers li a").click(addActiveClass);
});

$("#domain-name").keypress(function(e) {
    if (e.which == 13) {
        var domain = $('#domain-name').val();
        $("#servers").append('<li><a href="#">' + domain + '</a></li>');
        $('#domain-name').val('');
        $( "#servers li a").click(addActiveClass);
    }
});
