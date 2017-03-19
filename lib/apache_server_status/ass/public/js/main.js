$(document).ready(function () {
  $("#servers li a").click(function () {
      $(this).parent().addClass('active').siblings().removeClass('active');
      var server = $('li.active a').text();
      $("#appname").text(server);
        setInterval(function () {
            $.getJSON(('http://localhost:4567/' + server), function (data) {
                $(".box-requests").text(data.requests);
                $(".box-idle-workers").text(data.idle_workers);
                $(".box-requests-per-second").text(data.requests_per_second);
                $(".box-cpu").text(data.cpu);
                $(".box-load-average").text(data.load_average);
                $(".box-size-per-req").text(data.size_per_request);
                $(".box-title").text(data.size_title);
            });
        }, 500);
  });
});
