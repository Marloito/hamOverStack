$(document).ready( () => {
  $('.all-answers').on('submit', '.best-answer-selector', (e) => {
    e.preventDefault();
    const url_id = $(e.target).attr('action');
  $.ajax({
    method: 'post',
    url: url_id
  }).done( (response) => {
      console.log(response.includes('answers-show'));
      if (response.includes('answers-show')) {
        // deselecting
        $('.best-answer').hide();
        $('.select').show();
      } else {
        // selecting
        $('.best-answer').show();
        $('.best-answer').html(response);
        $('.deselect').show();
        $('.select').hide();

      }
    })
  })
});
