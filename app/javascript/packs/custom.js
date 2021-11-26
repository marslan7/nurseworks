document.addEventListener("turbolinks:load", function() {
  $(function() {
    var support_request_type_id = $('#support_request_support_request_type__id').val()
    var startDate = $('.start-date')[0];
    var endDate = $('.end-date')[0];
    $('#support_request_support_request_type_id').change(function() {
        if(this.value === support_request_type_id) {
          endDate.style.display = 'block';
          startDate.style.display = 'block';
        }
        else{
          endDate.style.display = 'none';
          startDate.style.display = 'none';
        }
    })
  });

  $(function(){
    $('.datepicker').datepicker({
      format: 'yyyy-mm-dd'
    });
  });
});
