$(document).ready(function () {
    $('#UINinput').focus();
    $('#UINinput').keydown(function (event) {
        if (event.keyCode == 13) {
            if ($('#UINinput').val() == ";E?") {
                $('#swipeMessage').text('Please Swipe Card Again.')
                $('#swipeMessage').removeClass().addClass('Error');
                $('#infoModal').modal('show').delay(2500).queue(function (next) {
                    $('#UINinput').val('');
                    $('#infoModal').modal('hide');
                    next();
                });
                return false;
            }
            else {
                var uin = $('#UINinput').val().trim().substring(5, 14);
                var event_id = (document.URL.split('='))[1];
                $.ajax({
                    url: '/event_users',
                    type: 'POST',
                    dataType: 'json',
                    data: {uin: uin, event_id: event_id}
                })
                    .done(function (result) {
                        //TODO: Handle Unregistered Members
                        if (result.status == 'success') {

                            $('#swipeMessage').text('Thanks ' + result.name + '. You have been marked as attended.')
                            $('#swipeMessage').removeClass().addClass('Success');
                            $('#infoModal').modal('show').delay(2500).queue(function (next) {
                                $('#UINinput').val('');
                                $('#infoModal').modal('hide');
                                next();
                            });
                        }
                        else{
                            $('#swipeMessage').text(result.message)
                            $('#swipeMessage').removeClass().addClass('Error');
                            $('#infoModal').modal('show').delay(2500).queue(function (next) {
                                $('#UINinput').val('');
                                $('#infoModal').modal('hide');
                                next();
                            });
                        }
                    }
                )
                    .
                    fail(function () {
                        //TODO: Handle Errors
                        console.log("error");
                    })
                    .always(function () {
                        //TODO: Put anything that should always run.
                        console.log("complete");
                    });

                return false;
            }
        }
    });
})
;