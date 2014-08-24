{{extends file='adminLayout.tpl'}}
{{block name="header"}}
<title>Dashboard</title>
{{/block}}
{{block name="content"}}
<div class="outer">
    <div class="inner">
        <div class="text-center">
            <ul class="stats_box">
                <li>
                    <div class="sparkline bar_week"></div>
                    <div class="stat_text">
                        <strong>2.345</strong>Weekly Visit
                        <span class="percent down"> <i class="fa fa-caret-down"></i> -16%</span>
                    </div>
                </li>
                <li>
                    <div class="sparkline line_day"></div>
                    <div class="stat_text">
                        <strong>165</strong>Daily Visit
                        <span class="percent up"> <i class="fa fa-caret-up"></i> +23%</span>
                    </div>
                </li>
                <li>
                    <div class="sparkline pie_week"></div>
                    <div class="stat_text">
                        <strong>$2 345.00</strong>Weekly Sale
                        <span class="percent"> 0%</span>
                    </div>
                </li>
                <li>
                    <div class="sparkline stacked_month"></div>
                    <div class="stat_text">
                        <strong>$678.00</strong>Monthly Sale
                        <span class="percent down"> <i class="fa fa-caret-down"></i> -10%</span>
                    </div>
                </li>
            </ul>
        </div>
        <hr>
        <div class="text-center">
            <a class="quick-btn" href="#">
                <i class="fa fa-bolt fa-2x"></i>
                <span>default</span>
                <span class="label label-default">2</span>
            </a>
            <a class="quick-btn" href="#">
                <i class="fa fa-check fa-2x"></i>
                <span>danger</span>
                <span class="label label-danger">2</span>
            </a>
            <a class="quick-btn" href="#">
                <i class="fa fa-building-o fa-2x"></i>
                <span>No Label</span>
            </a>
            <a class="quick-btn" href="#">
                <i class="fa fa-envelope fa-2x"></i>
                <span>success</span>
                <span class="label label-success">-456</span>
            </a>
            <a class="quick-btn" href="#">
                <i class="fa fa-signal fa-2x"></i>
                <span>warning</span>
                <span class="label label-warning">+25</span>
            </a>
            <a class="quick-btn" href="#">
                <i class="fa fa-external-link fa-2x"></i>
                <span>π</span>
                <span class="label btn-metis-2">3.14159265</span>
            </a>
            <a class="quick-btn" href="#">
                <i class="fa fa-lemon-o fa-2x"></i>
                <span>é</span>
                <span class="label btn-metis-4">2.71828</span>
            </a>
            <a class="quick-btn" href="#">
                <i class="fa fa-glass fa-2x"></i>
                <span>φ</span>
                <span class="label btn-metis-3">1.618</span>
            </a>
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-8">
                <div class="box">
                    <header>
                        <h5>Line Chart</h5>
                    </header>
                    <div class="body" id="trigo" style="height: 250px;"></div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="box">
                    <div class="body">
                        <table class="table table-condensed table-hovered sortableTable">
                            <thead>
                            <tr>
                                <th>Country
                                    <i class="fa fa-sort"></i>
                                    <i class="fa fa-sort-asc"></i>
                                    <i class="fa fa-sort-desc"></i>
                                </th>
                                <th>Visit
                                    <i class="fa fa-sort"></i>
                                    <i class="fa fa-sort-asc"></i>
                                    <i class="fa fa-sort-desc"></i>
                                </th>
                                <th>Time
                                    <i class="fa fa-sort"></i>
                                    <i class="fa fa-sort-asc"></i>
                                    <i class="fa fa-sort-desc"></i>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr class="active">
                                <td>Andorra</td>
                                <td>1126</td>
                                <td>00:00:15</td>
                            </tr>
                            <tr>
                                <td>Belarus</td>
                                <td>350</td>
                                <td>00:01:20</td>
                            </tr>
                            <tr class="danger">
                                <td>Paraguay</td>
                                <td>43</td>
                                <td>00:00:30</td>
                            </tr>
                            <tr class="warning">
                                <td>Malta</td>
                                <td>547</td>
                                <td>00:10:20</td>
                            </tr>
                            <tr>
                                <td>Australia</td>
                                <td>560</td>
                                <td>00:00:10</td>
                            </tr>
                            <tr>
                                <td>Kenya</td>
                                <td>97</td>
                                <td>00:20:00</td>
                            </tr>
                            <tr class="success">
                                <td>Italy</td>
                                <td>2450</td>
                                <td>00:10:00</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <hr>
        <div class="row">
            <div class="col-lg-12">
                <div class="box">
                    <header>
                        <h5>Calendar</h5>
                    </header>
                    <div id="calendar_content" class="body">
                        <div id='calendar'></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- end .inner -->
</div>

<!-- end .outer -->
{{/block}}
{{block name="scripts"}}
    {{js('admin/flot/jquery.flot.js')}}
    {{js('admin/flot/jquery.flot.selection.js')}}
    {{js('admin/flot/jquery.flot.resize.js')}}
    <script>
        $('document').ready(function(e){
            function dashboard() {
                "use strict";
                function a(a, b, c) {
                    $('<div id="tooltip">' + c + "</div>").css({position: "absolute", display: "none", top: b + 5, left: a + 5, border: "1px solid #fdd", padding: "2px", "background-color": "#000", color: "#fff"}).appendTo("body").fadeIn(200)
                }

                $(".inlinesparkline").sparkline();
                var b = [10, 8, 5, 7, 4, 4, 1];
                $(".dynamicsparkline").sparkline(b), $(".dynamicbar").sparkline(b, {type: "bar", barColor: "green"}), $(".inlinebar").sparkline("html", {type: "bar", barColor: "red"}), $(".sparkline.bar_week").sparkline([5, 6, 7, 2, 0, -4, -2, 4], {type: "bar", height: "40", barWidth: 5, barColor: "#4d6189", negBarColor: "#a20051"}), $(".sparkline.line_day").sparkline([5, 6, 7, 9, 9, 5, 4, 6, 6, 4, 6, 7], {type: "line", height: "40", drawNormalOnTop: !1}), $(".sparkline.pie_week").sparkline([1, 1, 2], {type: "pie", width: "40", height: "40"}), $(".sparkline.stacked_month").sparkline(["0:2", "2:4", "4:2", "4:1"], {type: "bar", height: "40", barWidth: 10, barColor: "#4d6189", negBarColor: "#a20051"});
                for (var c = new Date, d = c.getDate(), e = c.getMonth(), f = c.getFullYear(), g = $("#calendar").fullCalendar({header: {left: "prev,today,next,", center: "title", right: "month,agendaWeek,agendaDay"}, selectable: !0, selectHelper: !0, select: function (a, b, c) {
                    var d = prompt("Event Title:");
                    d && g.fullCalendar("renderEvent", {title: d, start: a, end: b, allDay: c}, !0), g.fullCalendar("unselect")
                }, editable: !0, events: [
                    {title: "All Day Event", start: new Date(f, e, 1), className: "label label-success"},
                    {title: "Long Event", start: new Date(f, e, d - 5), end: new Date(f, e, d - 2), className: "label label-info"},
                    {id: 999, title: "Repeating Event", start: new Date(f, e, d - 3, 16, 0), allDay: !1, className: "label label-warning"},
                    {id: 999, title: "Repeating Event", start: new Date(f, e, d + 4, 16, 0), allDay: !1, className: "label label-inverse"},
                    {title: "Meeting", start: new Date(f, e, d, 10, 30), allDay: !1, className: "label label-important"},
                    {title: "Lunch", start: new Date(f, e, d, 12, 0), end: new Date(f, e, d, 14, 0), allDay: !1},
                    {title: "Birthday Party", start: new Date(f, e, d + 1, 19, 0), end: new Date(f, e, d + 1, 22, 30), allDay: !1},
                    {title: "Click for Google", start: new Date(f, e, 28), end: new Date(f, e, 29), url: "http://google.com/"}
                ]}), h = [], i = [], j = 0; 14 > j; j += .5)h.push([j, Math.sin(j)]), i.push([j, Math.cos(j)]);
                var k = ($.plot($("#trigo"), [
                    {data: h, label: "sin(x)", points: {fillColor: "#4572A7", size: 5}, color: "#4572A7"},
                    {data: i, label: "cos(x)", points: {fillColor: "#333", size: 35}, color: "#AA4643"}
                ], {series: {lines: {show: !0}, points: {show: !0}}, grid: {hoverable: !0, clickable: !0}, yaxis: {min: -1.2, max: 1.2}}), null);
                $("#trigo").bind("plothover", function (b, c, d) {
                    if ($("#x").text(c.x.toFixed(2)), $("#y").text(c.y.toFixed(2)), d) {
                        if (k !== d.dataIndex) {
                            k = d.dataIndex, $("#tooltip").remove();
                            var e = d.datapoint[0].toFixed(2), f = d.datapoint[1].toFixed(2);
                            a(d.pageX, d.pageY, d.series.label + " of " + e + " = " + f)
                        }
                    } else $("#tooltip").remove(), k = null
                }), $(".sortableTable").tablesorter()
            }

            $(function() {
                dashboard();
            });
        });

    </script>
 {{/block}}