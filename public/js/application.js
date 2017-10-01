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
      $('#all-answers').append(response);
      $(e.target).find('textarea').val("");
    });

    request.fail((obj, status, error) => {
      $('#all-answers').append('<p style="color:red;font-size:10pt">Can not answer own question</p>');
      $(e.target).find('textarea').val("");
    });
  });
});
