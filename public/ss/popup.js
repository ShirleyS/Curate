function bindEvents() {
  $('form').on('submit', addResource);
}
//sets
function onPageDetailsReceived(pageDetails)  {
    $('#title').val(pageDetails.title);
    $('#url').val(pageDetails.url);
    $('#comment').val(pageDetails.comment);
}

function addResource(){
    event.preventDefault();
    //THE RATING ACCESS OF "CHECKED" IS INCREDIBLE!
    data = {title: $('#title').val(),
            url: $('#url').val(),
            rating: $("input[name*='rating']:checked").val(),
            comment: $('#comment').val(),
            tags: $('#tags').val(),
            dataType: 'json'};

    var ajaxRequest = $.ajax({
        // url: 'https://peaceful-refuge-3562.herokuapp.com/add_resource',
        url: 'http://localhost:9393/add_resource',
        type: 'POST',
        data: data
        });

        ajaxRequest.done(function(server_data){
          console.log("SUCCESS -- server returned: " + server_data);
        window.close();
        });

        ajaxRequest.fail(function(){
          console.log('fail');
        });

};

// popup shows up by default bc declared in manifest.
window.addEventListener('load', function(event) {

    statusDisplay = $('#status-display').val();
    $('#addResource').on('submit', addResource);
    chrome.runtime.getBackgroundPage(function(eventPage) {
        eventPage.getPageDetails(onPageDetailsReceived);
    });
});





