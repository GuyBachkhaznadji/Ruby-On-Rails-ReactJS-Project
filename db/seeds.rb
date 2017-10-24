AdminUser.delete_all
User.delete_all
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')



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
                javascript: ["javascript", "node", "'node.js'", "es2016", "es6", "ecmaScript"],
                java: ["java", "j2ee" ]
            },
        secondPriority: 
            {
                angular: ["angular", "angularjs", "'angular.js'"],
                react: ["react", "'react.js'", "reactJS"],
                restful: ["restful", "rest"],
                spring: ["spring"] 
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
                aws: ["aws", "'amazon web services'"],
                azure: ["azure"],
                docker: ["docker"],
                rhel: ["rhel", "'red hat'", "redhat"]
            },
        secondPriority: 
            {
                kubernetes: ["kubernetes", "k8s"],
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
                coach: ["'agile coach'"],
                kanban: ["kanban"],
                gds: ["gds", "'government digital service'"],
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
                scrum: ["csm", "psm", "scrum", "'certified scrum'"],
                kanban: ["kanban", "lean"],
                xp: ["bdd", "xp", "'extreme programming'"]
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
                ux: ["ux", "'user experience'"],
                research: ["research"],
                ui: ["ui", "'user design'", "interface"],
            },
		secondPriority: 
            {
                lab: ["lab"],
                profile: ["profile", "persona"],
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
                versions: ["'8.1'"]
            },
        secondPriority: 
            {
                mobile: ["mobile", "tablet", "iphone", "android", "blackberry", "ipad"],
                laptop: ["laptop", "lenovo"],
		    }
    }
)

ReverseLookUp.generate_all_reverses
all_words = WordList.collect_words
WordList.create({words: all_words})
