(function($){
	$.fn.listDish = function(options) {

		// Options par defaut
		var defaults = {};
				
		var options = $.extend(defaults, options);
        $("#listDishOfMenu").val("");

				
        var obj = $(this);

        // Emp�cher la s�lection des �l�ments � la sourirs (meilleure gestion du drag & drop)
        var _preventDefault = function(evt) { evt.preventDefault(); };
        $("li").bind("dragstart", _preventDefault).bind("selectstart", _preventDefault);

        $(".list").sortable({
            start: function(event, ui) {
                $(".contentAccordion").addClass("inheritOverflow");
                $(".list").addClass("hiddenOverflow");
            },
            stop: function(event, ui){
                $(".contentAccordion").removeClass("inheritOverflow");
                $(".list").removeClass("hiddenOverflow");
            }
        });

        $(".newMenu").sortable({
            axis: "y",
            containment: ".newMenu"
        });


        $(".newMenu").droppable({
            drop: function(event, ui){
                var idItemDragging = ui.draggable.attr("id");
                var text = ui.draggable.text();
                if (!ui.draggable.hasClass("itemNewMenu")) {
                    /*
                    var type;
                    if(ui.draggable.hasClass("entree")){
                        type = "en";
                    }
                    else if(ui.draggable.hasClass("dish")){
                        type = "di";
                    }else if(ui.draggable.hasClass("dessert")){
                        type = "de";
                    } */

                    $(".newMenu").prepend('<div id="new' + idItemDragging + '" class="itemDraggable itemNewMenu"><span>' + text + '</span><a id="remove' + idItemDragging + '" class="close removeItem" href="#">&times;</a></div>');
                    setTimeout(function() { ui.draggable.hide(); }, 1);

                    var id = idItemDragging;
                    if($("#listDishOfMenu").val() != ""){
                        id = "," + id;
                    }
                    $("#listDishOfMenu").val($("#listDishOfMenu").val() + id);
                }
            }

        });


        $(".dish_category").accordion();

		
		// On continue le chainage JQuery
		return this;
	};
    $(".removeItem").live("click",function(){
        $(this).parent().remove();
        var idItemRemove = $(this).attr("id").substring(6);

        $(".dish_category").find("#"+idItemRemove).show();

        //Tri des id
        var lengthOfId = idItemRemove.length + 1;
        var firstPartOfListId = $("#listDishOfMenu").val().substring(0, $("#listDishOfMenu").val().indexOf(idItemRemove));
        var secondPartOfListId = $("#listDishOfMenu").val().substring($("#listDishOfMenu").val().indexOf(idItemRemove) + lengthOfId);

        var newListId = firstPartOfListId + secondPartOfListId;
        $("#listDishOfMenu").val(newListId);
    });
})(jQuery);
