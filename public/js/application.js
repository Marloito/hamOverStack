$(document).ready( () => {
  $('.select-best-answer').on('submit', (e) => {
    e.preventDefault();
    const url_id = $(e.target).attr('action');
  $.ajax({
    method: 'post',
    url: url_id
  }).done( (response) => {
      console.log(response);
      $('.best-answer').html(response);
      $('.select-best-answer').hide();
    })
  })
});
