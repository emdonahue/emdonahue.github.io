function select_sublink () {
    var i;
    var selected = false;
    var subsections = document.getElementsByClassName("subsection");  
    var sublinks = document.getElementsByClassName("sublink");
    for (i=subsections.length-1;i>=0; i--) {
	if (!selected && (subsections[i].getBoundingClientRect().top <= 250)) {
	    selected = true;
	    sublinks[i].className = "sublink sub-selected";
	}
	else {
	    sublinks[i].className = "sublink";
	}
    }
};

window.onscroll = select_sublink;

window.onload = select_sublink;