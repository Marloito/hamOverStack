$(document).ready(() => {
  $('#answer-form').submit((e) => {
    e.preventDefault();
    const url = $(e.target).attr('action')
    const data = $(e.target).find('textarea').serialize();

    request = $.ajax({
      method: "POST",
      url,
      data
    });

    request.done((response) => {
      console.log(response)
      $('#all-answers').append(response);
      $(e.target).find('textarea').val("");
    });
  });
});
