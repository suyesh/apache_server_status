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
            $(".box-load-average").text(data.load_average);
            $(".box-size-per-req").text(data.size_per_request);
            $(".box-title").text(data.size_title);
        });
    }
}

$("#servers li a").click(addActiveClass);

$("#domain-name-button").click(function() {
    var domain = $('#domain-name').val();
    $("#servers").append('<li role="separator" class="divider"></li>');
    $("#servers").append('<li><a href="#">' + domain + '</a></li>');
    $("#notification").append('<div class="alert alert-success alert-dismissible"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Success!</strong><em>' +
        ' ' + domain + '</em> has been successfylly added to your servers list.');
    $("#notification").fadeOut(1000);
    $("#notification .alert").remove();
    $( "#servers li a").click(addActiveClass);
});

$("#domain-name").keypress(function(e) {
    if (e.which == 13) {
        var domain = $('#domain-name').val();
        $("#servers").append('<li role="separator" class="divider"></li>');
        $("#servers").append('<li><a href="#">' + domain + '</a></li>');
        $("#notification").append('<div class="alert alert-success alert-dismissible" role="alert"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button><strong>Success!</strong><em>' +
            ' ' + domain + '</em> has been successfylly added to your servers list.');
        $("#notification").fadeOut(1000);
        $( "#servers li a").click(addActiveClass);
    }
});
