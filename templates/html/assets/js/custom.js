/*===== CHECKS =====*/

let titles = Array.from(document.querySelectorAll(".title")).filter(title => title.childNodes[1].className === "succeed");

var collapse = function() {
    var finger = this.childNodes[1];
    var wrapper = this.parentNode.childNodes[5];
    var content = wrapper.childNodes[1].childNodes[1];
    finger.classList.toggle("rotate");
    wrapper.style.height = content.clientHeight + "px";
    wrapper.style.height = (wrapper.clientHeight) ? 0 + "px" : content.clientHeight + "px";
};


titles.forEach(t => {
    t.addEventListener("click", collapse, false);
});

contents.forEach(x => {
    x.classList.add("head");
});

/*===== UP =====*/

let up = document.getElementById("up");

window.onscroll = function() { scrollFunction() };

function scrollFunction() {
    if (document.body.scrollTop > 800 || document.documentElement.scrollTop > 800) {
        up.style.opacity = 1;
    } else {
        up.style.opacity = 0;
    }
}

function goTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

/*===== CHART =====*/


var stringToColour = function(str) {
    var hash = 0;
    for (var i = 0; i < str.length; i++) {
        hash = str.charCodeAt(i) + ((hash << 5) - hash);
    }
    var colour = '#';
    for (var i = 0; i < 3; i++) {
        var value = (hash >> (i * 8)) & 0xFF;
        colour += ('00' + value.toString(16)).substr(-2);
    }
    return colour;
}


new Chart("total", {
    type: "pie",
    data: {
        labels: ["Failed", "Succeed"],
        datasets: [{
            backgroundColor: [
                "#ac0e35",
                "#2c9477",
            ],
            data: [parseInt(document.querySelector(".stat[name='failed']").innerHTML), parseInt(document.querySelector(".stat[name='succeed']").innerHTML)]
        }]
    },
    options: {
        plugins: {
            title: {
                display: false,
                text: "Total checks"
            }
        }
    }
});

let categories = Array.from(document.querySelectorAll(".category")).map(function(c) { return c.attributes["name"].value; });

new Chart("categories", {
    type: "bar",
    data: {
        labels: categories,
        datasets: [{
            backgroundColor: categories.map(function(c) { return stringToColour(c); }),
            data: Array.from(document.querySelectorAll(".category")).map(function(c) { return parseInt(c.innerHTML); })
        }]
    },
    options: {
        plugins: {
            legend: {
                display: false
            },
            title: {
                display: true,
                text: "Number of checks"
            }
        }
    }
});