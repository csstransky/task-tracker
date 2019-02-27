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
  function update_stars(product_id) {
    $.ajax(`${rating_path}?product_id=${product_id}`, {
      method: "get",
      dataType: "json",
      contentType: "application/json; charset=UTF-8",
      data: "",
      success: (resp) => {
        let count = resp.data.length;
        let sum = _.sum(_.map(resp.data, (rat) => rat.stars));
        $('#rating-avg').text(`${sum/count} / 5 (${count} ratings)`);
      },
    });
  }

  $('#rating-button').click((ev) => {
    let rating = $('#rating-select').val();
    let user_id = $(ev.target).data('user-id');
    let product_id = $(ev.target).data('product-id');

    let text = JSON.stringify({
      rating: {
        user_id: user_id,
        product_id: product_id,
        stars: rating,
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

