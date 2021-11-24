document.addEventListener("turbolinks:load", function() {
  $(function() {
    var startDate = $('.start-date')[0];
    var endDate = $('.end-date')[0];
    $('#support_request_support_request_type_id').change(function() {
      if(this.value == 1) {
        endDate.style.display = 'block';
        startDate.style.display = 'block';
      }
      else{
        endDate.style.display = 'none';
        startDate.style.display = 'none';
      }
    })
  })
})

