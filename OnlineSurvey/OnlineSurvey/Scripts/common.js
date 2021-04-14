/*-----------------------------------------------------------------------------------
 Spinner
 ------------------------------------------------------------------------------------*/
function HideLoadingSpinner() {
    window.onscroll = function () { };
    document.getElementById("coverScreen").style.display = 'none';
}

function ShowLoadingSpinner() {
    $(window).scrollTop(0);
    document.getElementById("coverScreen").style.display = 'block';
    var x = window.scrollX;
    var y = window.scrollY;
    window.onscroll = function () { window.scrollTo(x, y); };
}

/*-----------------------------------------------------------------------------------
 JSON Date Format
 ------------------------------------------------------------------------------------*/
function FormatJSONDate(jsonDate) {
    var dateString = jsonDate.substr(6);
    var currentTime = new Date(parseInt(dateString));
    var month = currentTime.getMonth() + 1;
    var day = currentTime.getDate();
    var year = currentTime.getFullYear();

    var strDay = day < 10 ? '0' + day.toString() : day;
    var strMonth = month < 10 ? '0' + month.toString() : month;

    //var date = strDay + "/" + strMonth + "/" + year;
    var date = strMonth + "/" + strDay + "/" + year;

    return date;
}

function validateControls(controls) {
    var isValid = true;
    var errorControls = [];

    // var elements = controls;// document.getElementById(formID).querySelectorAll("[required]");

    $.each(controls, function (index, controlID) {
        var element = document.getElementById(controlID);

        var label = $("label[for='" + element.id + "']")[0];
        if (label) {
            var errorID = element.id + "_Error";
            var error = "<span style='color:red;' id='" + errorID + "'>" + label.innerText + " is a required field" + "</span>";

            if ($(element).val() == "" || $(element).val() == null) {
                if (document.getElementById(errorID) == null) {
                    $(element).parents('.form-group').append(error);
                }
                    $(element).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
                    $(element).closest('.help-block').remove();
                    element.style.borderColor = "red";
                    errorControls.push(element.id);
                
            } else {
                $(element).closest('.form-group').removeClass('has-success has-error');
                $(element).closest('.help-block').remove();
                element.style.borderColor = "";
                if (document.getElementById(errorID)) {
                    element.parentNode.removeChild(document.getElementById(errorID));
                }
            }

            isValid = errorControls.length > 0 ? false : true;

            element.onblur = function () {
                var val = $(element).val();
                if ($(element).val() != "" || $(element).val() != null) {
                    $(element).closest('.form-group').removeClass('has-success has-error');
                    $(element).closest('.help-block').remove();
                    if (document.getElementById(errorID)) {
                        element.parentNode.removeChild(document.getElementById(errorID));
                    }
                    element.style.borderColor = "";
                    const index = errorControls.indexOf(element.id);
                    if (index > -1) {
                        errorControls.splice(index, 1);
                    }
                } else {
                    if (document.getElementById(errorID) == null) {
                        $(element).parents('.form-group').append(error);
                    }
                        $(element).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
                        $(element).closest('.help-block').remove();
                        element.style.borderColor = "red";

                        errorControls.push(element.id);
                }

                isValid = errorControls.length > 0 ? false : true;

                return false;
            };
        }
    });

    return isValid;
}

function clearValidationControlsErrors(controls) {
    $.each(controls, function (index, controlID) {
        var element = document.getElementById(controlID);
        var label = $("label[for='" + element.name + "']")[0];
        if (label) {
            var errorID = element.id + "_Error";
            if (document.getElementById(errorID)) {
                element.parentNode.removeChild(document.getElementById(errorID));
            }
        }
    });
}

function InitializeMultiSelect(controlID) {
    $("#" + controlID).multiselect({
        buttonText: function (options, select) {
            if (options.length === 0) {
                return 'Select...';
            } else if (options.length > 0) {
                return 'Selected Options (' + options.length + ')';
            } else {
                var labels = [];
                options.each(function () {
                    if ($(this).attr('label') !== undefined) {
                        labels.push($(this).attr('label'));
                    }
                    else {
                        labels.push($(this).html());
                    }
                });
                return labels.join(',') + '';
            }
        },
        buttonWidth: '250px'
    });
}

$(document).ready(function () {
    var inputList = document.querySelectorAll('input[type="number"]');
    for (var i = 0; i < inputList.length; i++) {
        var input = inputList[i];

        $(input).blur(function () {
            var val = this.value;
            if (this.value == "") {
                this.value = "0";
            }
        });

        if (input.value == "") {
            input.value = "0";
        }
    }
});