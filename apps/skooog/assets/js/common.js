$(function() {
    
    init_button_icons();

});



function init_button_icons() {

    $(".btn-glyphicon").each(function() {
        const self = $(this);
            self
            .attr("class")
            .split(" ")
            .filter(s => s.startsWith("btn-glyphicon-"))
            .forEach(function(element) {
                const insert = $('<span />', {class: "glyphicon"})
                    .addClass(element.replace(/btn-/gi, ""))
                    .html("");
                const html = insert.get(0).outerHTML;
                const text = self.html();
                self.html(html + " " + text);
            });
    });

}