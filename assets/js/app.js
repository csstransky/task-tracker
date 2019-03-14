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

$(function () {
  // TODO: Comeback to this and fix everything later
  $('#time-end-button').click((ev) => {
    let task_id = $(ev.target).data('task-id');
    let time_start = $('#time-start').val();
    let time_end = $('#time-end').val();

    let text = JSON.stringify({
      time_block: {
        time_start: time_start,
        time_end: time_end,
        task_id: task_id,
      },
    });

    $.ajax(rating_path, {
      method: "post",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: text,
      success: (resp) => {
        $('#rating-form').text(`(your rating: ${resp.data.stars})`);
        update_stars(product_id);
      },
    });
  });
});
