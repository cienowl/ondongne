jQuery(function() {
    jQuery("#jquery-tagbox-text").tagBox();
    jQuery("#jquery-tagbox-select").tagBox({ 
      enableDropdown: true, 
      dropdownSource: function() {
        return jQuery("#jquery-tagbox-select-options");
      }
    });
  });
  function printinfo(){
    var required_input = document.getElementsByClassName('required_input');
    var labels = document.getElementsByClassName('required_inputLabel');
    // alert(required_input.length);
    // alert(labels.length);
    // alert(required_input[0].value);
    // alert(labels[0].innerHTML);
    alert(required_input[1].value);
    for(var i=0;i<required_input.length;i++){
        if(required_input[i].value=="")
            alert(labels[i].innerText+"를 입력해주세요.");
    }
  }