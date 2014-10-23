# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
DoiBase.create(doi_path: '666.36991950/765421941732')
DoiBase.create(doi_path: '666.60274838/822818480188')
DoiBase.create(doi_path: '666.29973957/456208238595')
DoiBase.create(doi_path: '666.51509035/965590528980')
DoiBase.create(doi_path: '666.11219405/760348033262')
DoiBase.create(doi_path: '666.39066523/346427394213')
DoiBase.create(doi_path: '666.82733058/252771848413')
DoiBase.create(doi_path: '666.71298439/565134566473')
DoiBase.create(doi_path: '666.76860935/158646984892')
DoiBase.create(doi_path: '666.14909332/518051274890')
DoiBase.create(doi_path: '666.35351243/809798096663')
DoiBase.create(doi_path: '666.35351243/809798096693')
#DoiBase.create(doi_path: '')

DoiHistory.create(name: 'A shitty search engine', description: 'They send all your data to everywhere', url: 'http://www.google.com', created: Time.now, updated: Time.now, doi_base_id: '1')
DoiHistory.create(name: 'Place all you life online', description: 'A social media site private investigators love', url: 'http://www.facebook.com', created: Time.now, updated: Time.now, doi_base_id: '2')
DoiHistory.create(name: 'Amazon Corp', description: 'Homepage for amazon corp', url: 'http://www.amazon.com', created: Time.now, updated: Time.now, doi_base_id: '3')
DoiHistory.create(name: 'Let me fucking google that for you', description: 'When you have to google something for someone', url: 'http://lmgtfy.com/', created: Time.now, updated: Time.now, doi_base_id: '4')
DoiHistory.create(name: 'Twitter', description: 'Send some charactors instead of working', url: 'http://twiter.com', created: Time.now, updated: Time.now, doi_base_id: '5')
DoiHistory.create(name: 'Da Da Da', description: 'This site will break stuff cause its not properly format URL', url: 'www.hi.com', created: Time.now, updated: Time.now, doi_base_id: '6')
DoiHistory.create(name: '4chan', description: 'A fun place for all', url: 'http://www.4chan.org/', created: Time.now, updated: Time.now, doi_base_id: '7')
DoiHistory.create(name: 'Random on 4chan', description: 'Not FOR THE TIMID', url: 'http://boards.4chan.org/b/', created: Time.now, updated: Time.now, doi_base_id: '8')
DoiHistory.create(name: 'Internet Relay Chat', description: 'The true chat room on social media network', url: 'http://www.irc.org/', created: Time.now, updated: Time.now, doi_base_id: '9')
DoiHistory.create(name: 'Ruby Active Record Docs', description: 'A horrible site that is not formated well', url: 'http://guides.rubyonrails.org/active_record_basics.html', created: Time.now, updated: Time.now, doi_base_id: '10')
DoiHistory.create(name: 'News for Nerds', description: 'Ok site kindof going down hill', url: 'http://slashdot.org/', created: Time.now, updated: Time.now, doi_base_id: '11')
DoiHistory.create(name: 'Tyson Henrys Site', description: 'Pretty kewl teacher.....if i get a good grade else entry.description.change.badreview()', url: 'http://www.ecst.csuchico.edu/~tyson/', created: Time.now, updated: Time.now, doi_base_id: '12')
#DoiHistory.create(name: '', description: '', url: '', created: Time.now, updated: Time.now, doi_base_id: '13')
