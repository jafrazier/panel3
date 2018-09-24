$( document ).ready(function() {
  $('.studentList').hide();
  $('.cohortList').hide();
  $('.showStudents').click(function(){
    $(this).next('div').slideToggle(1000);
  });
  $('.showCohots').click(function(){
    $(this).next('div').slideToggle(1000);
  });

});
