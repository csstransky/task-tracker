// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery;
import "bootstrap";
import _ from "lodash";

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// <p id="time-start-text">Time start</p>
// <button id="time-start-button" class="btn btn-primary">Time Start</button>
// <p id="time-end-text">Time end</p>
// <button id="time-end-button" class="btn btn-secondary">Time End</button>
// <script>
//  window.rating_path = "<%= Routes.time_block_path(@conn, :create) %>";
// </script>

$(function () {
  function update_text(task_id) {
    $.ajax(`${text_block_path}?task_id=${task_id}`, {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: "",
      success: (resp) => {
        $('#time-end-text').text(`(Hello: ${resp.data.time_end})`);
      },
    });
  }
  $('#time-end-button').click((ev) => {
    let task_id = $(ev.target).data('task-id');
    let time_start = $('#time-start-text').val();
    let time_end = $('#time-end-text').val();

    let text = JSON.stringify({
      time_block: {
        time_start: time_start,
        time_end: new Date(Date.now()),
        task_id: task_id,
      },
    });

    $.ajax(time_block_path, {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (resp) => {
        $('#time-start-text').text(`(your rating: ${resp.data.time_end})`);
        update_text(task_id);
      },
    });
  });
  $('#time-start-button').click((ev) => {
    var current_date =  new Date(Date.now());
    $('#time-start-text').text(current_date);
  });
});
