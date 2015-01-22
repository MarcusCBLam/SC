/*jslint */
/*global AdobeEdge: false, window: false, document: false, console:false, alert: false */
(function (compId) {

    "use strict";
    var im='http://soundcraft.com.s3.amazonaws.com/homepage/features/edge_vi3000/',
        aud='media/',
        vid='media/',
        js='/',
        fonts = {
        },
        opts = {
            'gAudioPreloadPreference': 'auto',
            'gVideoPreloadPreference': 'auto'
        },
        resources = [
        ],
        scripts = [
        ],
        symbols = {
            "stage": {
                version: "5.0.1",
                minimumCompatibleVersion: "5.0.0",
                build: "5.0.1.386",
                scaleToFit: "both",
                centerStage: "horizontal",
                resizeInstances: false,
                content: {
                    dom: [
                        {
                            id: 'e_bg2',
                            type: 'image',
                            rect: ['0px', '0px', '1200px', '500px', 'auto', 'auto'],
                            opacity: '1',
                            fill: ["rgba(0,0,0,0)",im+"e_bg2.jpg",'0px','0px']
                        },
                        {
                            id: 'e_vi3000',
                            type: 'image',
                            rect: ['-744px', '0px', '836px', '500px', 'auto', 'auto'],
                            opacity: '0',
                            fill: ["rgba(0,0,0,0)",im+"e_vi3000.png",'0px','0px'],
                            filter: [0, 0, 1, 1, 0, 0, 0, 0, "rgba(0,0,0,0)", 0, 0, 0]
                        },
                        {
                            id: 'e_vistonics',
                            type: 'image',
                            rect: ['828px', '226px', '295px', '67px', 'auto', 'auto'],
                            opacity: '0',
                            fill: ["rgba(0,0,0,0)",im+"e_vistonics.png",'0px','0px']
                        },
                        {
                            id: 'e_dots',
                            type: 'image',
                            rect: ['826px', '199px', '65px', '35px', 'auto', 'auto'],
                            opacity: '1',
                            fill: ["rgba(0,0,0,0)",im+"e_dots.png",'0px','0px']
                        },
                        {
                            id: 'e_texts',
                            type: 'image',
                            rect: ['831px', '278px', '355px', '91px', 'auto', 'auto'],
                            opacity: '0',
                            fill: ["rgba(0,0,0,0)",im+"e_texts.png",'0px','0px']
                        },
                        {
                            id: 'e_info2',
                            type: 'image',
                            rect: ['1050px', '500px', '150px', '50px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,0)",im+"e_info2.png",'0px','0px']
                        },
                        {
                            id: 'e_logo2',
                            type: 'image',
                            rect: ['830px', '500px', '220px', '31px', 'auto', 'auto'],
                            fill: ["rgba(0,0,0,0)",im+"e_logo2.png",'0px','0px']
                        }
                    ],
                    style: {
                        '${Stage}': {
                            isStage: true,
                            rect: ['null', 'null', '1200px', '500px', 'auto', 'auto'],
                            overflow: 'hidden',
                            fill: ["rgba(0,0,0,1.00)"]
                        }
                    }
                },
                timeline: {
                    duration: 2000,
                    autoPlay: true,
                    labels: {
                        "restart": 1015,
                        "go back": 2000
                    },
                    data: [
                        [
                            "eid74",
                            "top",
                            625,
                            170,
                            "linear",
                            "${e_logo2}",
                            '500px',
                            '439px'
                        ],
                        [
                            "eid44",
                            "opacity",
                            550,
                            75,
                            "linear",
                            "${e_dots}",
                            '0',
                            '1'
                        ],
                        [
                            "eid42",
                            "left",
                            550,
                            75,
                            "linear",
                            "${e_dots}",
                            '835px',
                            '826px'
                        ],
                        [
                            "eid57",
                            "opacity",
                            1000,
                            500,
                            "linear",
                            "${e_bg2}",
                            '1',
                            '0.5'
                        ],
                        [
                            "eid58",
                            "opacity",
                            1500,
                            500,
                            "linear",
                            "${e_bg2}",
                            '0.5',
                            '1'
                        ],
                        [
                            "eid67",
                            "top",
                            550,
                            140,
                            "linear",
                            "${e_info2}",
                            '500px',
                            '430px'
                        ],
                        [
                            "eid14",
                            "left",
                            0,
                            625,
                            "linear",
                            "${e_vistonics}",
                            '1027px',
                            '828px'
                        ],
                        [
                            "eid5",
                            "left",
                            0,
                            500,
                            "linear",
                            "${e_vi3000}",
                            '-744px',
                            '0px'
                        ],
                        [
                            "eid18",
                            "left",
                            0,
                            625,
                            "linear",
                            "${e_texts}",
                            '1029px',
                            '831px'
                        ],
                        [
                            "eid10",
                            "opacity",
                            0,
                            500,
                            "linear",
                            "${e_vi3000}",
                            '0',
                            '1'
                        ],
                        [
                            "eid41",
                            "opacity",
                            0,
                            625,
                            "linear",
                            "${e_vistonics}",
                            '0',
                            '1'
                        ],
                        [
                            "eid40",
                            "opacity",
                            0,
                            625,
                            "linear",
                            "${e_texts}",
                            '0',
                            '1'
                        ]
                    ]
                }
            }
        };

    AdobeEdge.registerCompositionDefn(compId, symbols, fonts, scripts, resources, opts);

    if (!window.edge_authoring_mode) AdobeEdge.getComposition(compId).load("http://soundcraft.com.s3.amazonaws.com/homepage/features/edge_vi3000/edge_vi3000_edgeActions.js");
})("EDGE-vi3000");
