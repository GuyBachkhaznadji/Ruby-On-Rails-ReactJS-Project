AdminUser.delete_all
User.delete_all
AdminUser.create!(email: 'guysergebach@hotmail.com', password: 'ggyZzi52', password_confirmation: 'ggyZzi52')
User.create!(email: 'guysergebach@hotmail.com', password: 'ggyZzi52', password_confirmation: 'ggyZzi52')
User.create!(email: 'e.cotterill@parity.net', password: 'sherbetLemon', password_confirmation: 'sherbetLemon')

# db.reverseLookUp.insertMany(
# 	[
# 		{	
#             title: "Software Developer",
#             keywords:
#             {
#                 JavaScript: ["javaScript", "firstPriority"],
#                 Node: ["javaScript", "firstPriority"],
#                 "'Node.js'": ["javaScript", "firstPriority"],
#                 Java:["java", "firstPriority"],
#                 J2EE:["java", "firstPriority"]
#             }  
# 		}
# 	]
# ) 
Profile.delete_all
ReverseLookUp.delete_all
WordList.delete_all
Search.delete_all
Feedback.delete_all

soft_dev = Profile.create(	
    {
        title: "Software Developer",
        firstPriority: 
            {
                javascript: ["javascript", "node", "node.js", "es2016", "es6", "ecmaScript"],
                java: ["java", "j2ee" ]
            },
        secondPriority: 
            {
                angular: ["angular", "angularjs", "angular.js"],
                react: ["react", "react.js", "reactJS"],
                restful: ["restful", "rest"],
                spring: ["spring"],
                hibernate: ["hibernate"] 
            },
        thirdPriority:
            {
                apache: ["apache", "tomcat"],
                agile: ["agile", "scrum", "kanban"],
                testing: ["tdd", "bdd", "'driven development'"]
            },
        fourthPriority:
            {
                mongodb: ["mongodb", "nosql", "mongo"],
                postgres: ["postgresql", "postgres"],
                html: ["html", "html5"],
                css: ["css", "css3", "sass", "scss"]
            }
    }
)

devops = Profile.create(	
    {  
        title: "DevOps",
        firstPriority: 
            {
                ansible: ["ansible"],
                chef: ["chef"],
                puppet: ["puppet"],
                aws: ["aws", "'amazon web services'", "amazon"],
                azure: ["azure"],
                docker: ["docker", "containerization", "containerisation"],
                rhel: ["rhel", "'red hat'", "redhat", "red"],
                satellite: ["satellite"]
            },
        secondPriority: 
            {
                kubernetes: ["kubernetes", "k8s"],
                openshift: ["openshift"],
                jenkins: ["jenkins", "hudson"]
            },
        thirdPriority: 
            {

            },
        fourthPriority: 
            {

            }
    }
)

agile_coach = Profile.create(
    {
        title: "Agile Coach",
        firstPriority: 
            {
                coach: ["coach"],
                agile: ["agile"],
                kanban: ["kanban", "lean"],
                gds: ["gds", "'government digital service'", "government"],
                testing: ["bdd", "tdd", "behaviour"],
                product: ["product"]
            },        
        secondPriority: 
            {

            },
        thirdPriority: 
            {

            },
        fourthPriority: 
            {

            }
    }
)

scrum_master = Profile.create(
    {
        title: "Scrum Master",
        firstPriority: 
            {
                scrum: ["csm", "psm", "scrum"],
                kanban: ["kanban", "lean"],
                xp: ["bdd", "xp", "'extreme programming'", "extreme"]
            },
        secondPriority: 
            {

            },
        thirdPriority: 
            {

            },
        fourthPriority: 
            {

            }
    }
)

ux = Profile.create(
    {
        title: "User Experience",
        firstPriority:
            {
                accessibility: ["accessibility", "usability"],
                ux: ["ux", "'user experience'", "user"],
                research: ["research"],
                ui: ["ui", "'user design'", "interface"]
            },
		secondPriority: 
            {
                lab: ["lab"],
                profile: ["profile", "persona"]
            },
		thirdPriority:
            {
                mobile: ["mobile"]
            },
        fourthPriority: 
            {

            }
    }
)

first_line_support = Profile.create( 
    {
        title: "1st Line Support",
        firstPriority: 
            {
                nhs: ["nhs"],
                blackberry: ["blackberry", "bes", "bes12"],
                exchange: ["exchange"],
                office: ["office"],
                windows: ["windows"],
                versions: ["8.1"]
            },
        secondPriority: 
            {
                mobile: ["mobile", "tablet", "iphone", "android", "blackberry", "ipad"],
                laptop: ["laptop", "lenovo"],
            },
            thirdPriority:
            {
                mobile: ["mobile"]
            },
        fourthPriority: 
            {

            }
    }
)

# tester = Profile.create(	
#     {
#         title: "Automation Test Analyst",
#         firstPriority: 
#             {
#                 bdd: ["bdd", "tdd", "'Behaviour Driven Development'"],
#                 cucumber: ["gherkin", "cucumber"],
#                 selenium: ["selenium", "seleniumwebdriver"]
#             },
#         secondPriority: 
#             {
#             },
#         thirdPriority:
#             {

#             },
#         fourthPriority:
#             {

#             }
#     }
# )

network = Profile.create(	
        {
            title: "Networking / VMware",
            firstPriority: 
                {
                    ccna: ["ccna"],
                    ccnp: ["ccnp"],
                    ccdp: ["ccdp"],
                    vca: ["vca", "'VMware Certified Associate'"],
                    vcp: ["vcp", "'VMware Certified Professional'", "SDN"],
                    vcap: ["vcap", "'VMware Certified Advanced Professional'"],
                    vcdx: ["vcdx", "'VMware Certified Design Expert'"],
                    dcv: ["dcv", "'data centre virtualization'"],
                    nv: ["nv", "'network virtualization'"],
                    cma: ["cma", "cloud management and automation"],
                    dtm: ["dtm", "Desktop and Mobility"],
                    dbt: ["dbt", "Digital Business Transformation"]
                },
            secondPriority: 
                {
                    firewall: ["checkpoint", "fortinet", "juniper", "firewall"],
                    voip: ["voip", "voiceover", "voice over"],
                    vsphere: ["vSphere"],
                    nsx: ["nsx"],
                    vrealize: ["vrealize", "vrealise", "vRA", "vROps"]
                },
            thirdPriority:
                {
    
                },
            fourthPriority:
                {
    
                }
    }
)


hr = Profile.create(	
    {
        title: "Human Resources",
        firstPriority: 
                {
                    cipd: ["cipd"],
                    union: ["union", "unionised", "unionized"],
                    relations: ["'employee relations'", "relations"],
                    rewards: ["rewards", "benefits"],
                    performance: ["disciplinary", "grievance", "absence", "performance"],
                    recruitment: ["recruitment", "campaign"]
                },
            secondPriority: 
                {
                    tna: ["tna", "'training needs analysis'" "needs"],
                    ilm: ["ilm", "'Institute of Leadership'", "leadership"],
                    ld: ["L&D", "learning", "development"]
                },
            thirdPriority:
                {
    
                },
            fourthPriority:
                {
    
                }
        }
)

procurement = Profile.create(	
    {
        title: "Procurement",
        firstPriority: 
                {
                    cips: ["mcips", "cips", "'Institute of Purchasing'"],
                    ojeu: ["ojeu", "ojec", "'Official Journal of the European Union'", ]
                },
            secondPriority: 
                {
                    water: ["'(Water OR Power OR Construction)'", "water", "construction", "power"],
                    pcs: ["pcs", "'public contracts scotland'"],
                    itt: ["itt", "'invitation to tender'"],
                    pqq: ["pqq", "'prequalification questionnaire'"]
                },
            thirdPriority:
                {
    
                },
            fourthPriority:
                {
    
                }
        }
    )

ReverseLookUp.generate_all_reverses
all_words = WordList.collect_words
WordList.create({words: all_words})

