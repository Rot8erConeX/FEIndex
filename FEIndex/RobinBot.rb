@shardizard = ARGV.first.to_i              # taking a single variable from the command prompt to get the shard value
@shards = 3                                # total number of shards
system("color 0#{"BCD0E"[@shardizard,1]}") # command prompt color and title determined by the shard
system("title loading #{['Plegian/Vallite','Ylissian/Hoshidan','Valmese/Nohrian','','Golden'][@shardizard]} RobinBot")

require 'discordrb'                    # Download link: https://github.com/meew0/discordrb
require 'open-uri'                     # pre-installed with Ruby in Windows
require 'net/http'                     # pre-installed with Ruby in Windows
require 'certified'
require 'tzinfo/data'                  # Downloaded with active_support below, but the require must be above active_support's require
require 'rufus-scheduler'              # Download link: https://github.com/jmettraux/rufus-scheduler
require 'active_support/core_ext/time' # Download link: https://rubygems.org/gems/activesupport/versions/5.0.0
require_relative 'rot8er_functs' # functions I use commonly in bots

# this is required to get her to post messages in a certain server when specific criteria are met
ENV['TZ'] = 'America/Chicago'
@scheduler = Rufus::Scheduler.new

# All the possible command prefixes
@prefixes={}
load "C:/Users/#{@mash}/Desktop/devkit/FEPrefix.rb"

prefix_proc = proc do |message|
  next pseudocase(message.text[3..-1]) if message.text.downcase.start_with?('fe!')
  next pseudocase(message.text[3..-1]) if message.text.downcase.start_with?('fe?')
  next pseudocase(message.text[4..-1]) if message.text.downcase.start_with?('fea!')
  next pseudocase(message.text[4..-1]) if message.text.downcase.start_with?('fea?')
  next pseudocase(message.text[4..-1]) if message.text.downcase.start_with?('fef!')
  next pseudocase(message.text[4..-1]) if message.text.downcase.start_with?('fef?')
  next pseudocase(message.text[5..-1]) if message.text.downcase.start_with?('fe13!')
  next pseudocase(message.text[5..-1]) if message.text.downcase.start_with?('fe13?')
  next pseudocase(message.text[5..-1]) if message.text.downcase.start_with?('fe14!')
  next pseudocase(message.text[5..-1]) if message.text.downcase.start_with?('fe14?')
  load "C:/Users/#{@mash}/Desktop/devkit/FEPrefix.rb"
  next if message.channel.server.nil? || @prefixes[message.channel.server.id].nil? || @prefixes[message.channel.server.id].length<=0
  prefix = @prefixes[message.channel.server.id]
  # We use [prefix.size..-1] so we can handle prefixes of any length
  next pseudocase(message.text[prefix.size..-1]) if message.text.downcase.start_with?(prefix.downcase)
  next
end

# The bot's token is basically their password, so is censored for obvious reasons
if @shardizard==4
  bot = Discordrb::Commands::CommandBot.new token: '>Debug Token<', client_id: 431895561193390090, prefix: prefix_proc
elsif @shardizard>4
  bot = Discordrb::Commands::CommandBot.new token: '>Token<', shard_id: (@shardizard-1), num_shards: @shards, client_id: 304652483299377182, prefix: prefix_proc
else
  bot = Discordrb::Commands::CommandBot.new token: '>Token<', shard_id: @shardizard, num_shards: @shards, client_id: 304652483299377182, prefix: prefix_proc
end
bot.gateway.check_heartbeat_acks = false

@shigure_class_kids=["Shigure","Elentil","DizJr","Portia"]
@names=[["Unit", "Ana", "Anna"],["Unit", "Harold", "Arthur"],["Unit", "Gurei", "Asugi"],["Unit", "Asama", "Azama"],["Unit", "Aqua", "Azura"],
        ["Unit", "Bajirio", "Basilio"],["Unit", "Benoit", "Benny"],["Unit", "Berka", "Beruka"],["Unit", "Bredy", "Brady"],["Unit", "Buredi", "Brady"],
        ["Unit", "Matoi", "Caeldori"],["Unit", "Riceload", "Caeldori"],["Unit", "Serge", "Cherche"],["Unit", "Seruju", "Cherche"],
        ["Unit", "Zelcher", "Cherche"],["Unit", "Krom", "Chrom"],["Unit", "Kuromu", "Chrom"],["Unit", "Tiamo", "Cordelia"],["Unit", "Kamui", "Corrin"],
        ["Unit", "Shinshia", "Cynthia"],["Unit", "Denis", "Donnel"],["Unit", "Doni", "Donnel"],["Unit", "Donny", "Donnel"],["Unit", "Deere", "Dwyer"],
        ["Unit", "Elfie", "Effie"],["Unit", "CinnamonRoll", "Elise"],["Unit", "Emelina", "Emmeryn"],["Unit", "Emerina", "Emmeryn"],
        ["Unit", "Furavia", "Flavia"],["Unit", "Foleo", "Forrest"],["Unit", "Frederik", "Frederick"],["Unit", "Furederiku", "Frederick"],
        ["Unit", "Fuuga", "Fuga"],["Unit", "Gaia", "Gaius"],["Unit", "Guire", "Gaius"],["Unit", "Jerome", "Gerome"],["Unit", "Jeromu", "Gerome"],
        ["Unit", "Grego", "Gregor"],["Unit", "Gurego", "Gregor"],["Unit", "Gunther", "Gunter"],["Unit", "Kazahana", "Hana"],["Unit", "Tsukuyomi", "Hayato"],
        ["Unit", "Henri", "Henry"],["Unit", "Ignis", "Ignatius"],["Unit", "Azur", "Inigo"],["Unit", "Azure", "Inigo"],["Unit", "Azuru", "Inigo"],
        ["Unit", "Joker", "Jakob"],["Unit", "Nishiki", "Kaden"],["Unit", "Kagerou", "Kagero"],["Unit", "Kanna", "Kana"],["Unit", "Suzukaze", "Kaze"],
        ["Unit", "Flannel", "Keaton"],["Unit", "Callum", "Kellam"],["Unit", "Karamu", "Kellam"],["Unit", "Kisaragi", "Kiragi"],["Unit", "Degel", "Kjelle"],
        ["Unit", "Dejeru", "Kjelle"],["Unit", "Lazward", "Laslow"],["Unit", "Loran", "Laurent"],["Unit", "Roran", "Laurent"],["Unit", "Leon", "Leo"],
        ["Unit", "Libera", "Libra"],["Unit", "Ribera", "Libra"],["Unit", "Riviera", "Libra"],["Unit", "Liz", "Lissa"],["Unit", "Rizu", "Lissa"],
        ["Unit", "Lon'zu", "Lon'qu"],["Unit", "Lonqu", "Lon'qu"],["Unit", "Lonzu", "Lon'qu"],["Unit", "Ronku", "Lon'qu"],["Unit", "Ronkuu", "Lon'qu"],
        ["Unit", "Rukina", "Lucina"],["Unit", "Mariabel", "Maribelle"],["Unit", "Mariabell", "Maribelle"],["Unit", "Mariaberu", "Maribelle"],
        ["Unit", "Midoriko", "Midori"],["Unit", "Mirieru", "Miriel"],["Unit", "Linfan", "Morgan"],["Unit", "Maku", "Morgan"],["Unit", "Marc", "Morgan"],
        ["Unit", "Mark", "Morgan"],["Unit", "Mozume", "Mozu"],["Unit", "n_n", "Nah"],["Unit", "Nn", "Nah"],["Unit", "Zero", "Niles"],
        ["Unit", "Eponine", "Nina"],["Unit", "Noir", "Noire"],["Unit", "Nowaru", "Noire"],["Unit", "Nono", "Nowi"],["Unit", "Olivie", "Olivia"],
        ["Unit", "Orivie", "Olivia"],["Unit", "Eudes", "Owain"],["Unit", "Udo", "Owain"],["Unit", "Wood", "Owain"],["Unit", "Berubetto", "Panne"],
        ["Unit", "Palne", "Panne"],["Unit", "Velvet", "Panne"],["Unit", "Lutz", "Percy"],["Unit", "Pieri", "Peri"],["Unit", "Paris", "Priam"],
        ["Unit", "Parisu", "Priam"],["Unit", "Yuugiri", "Reina"],["Unit", "Syalla", "Rhajat"],["Unit", "Licht", "Ricken"],["Unit", "Richt", "Ricken"],
        ["Unit", "Rihito", "Ricken"],["Unit", "Rinka", "Rinkah"],["Unit", "Daraen", "Robin"],["Unit", "Reflet", "Robin"],["Unit", "Rufure", "Robin"],
        ["Unit", "Lobster", "Ryoma"],["Unit", "Ryouma", "Ryoma"],["Unit", "Saizou", "Saizo"],["Unit", "Sairi", "Say'ri"],["Unit", "Sayri", "Say'ri"],
        ["Unit", "Crimson", "Scarlet"],["Unit", "Luna", "Selena"],["Unit", "Kinu", "Selkie"],["Unit", "Selena", "Severa"],["Unit", "Serena", "Severa"],
        ["Unit", "Shinonome", "Shiro"],["Unit", "Asyura", "Shura"],["Unit", "Sort", "Stahl"],["Unit", "Soru", "Stahl"],["Unit", "Tsubaki", "Subaki"],
        ["Unit", "Soiree", "Sully"],["Unit", "Soware", "Sully"],["Unit", "Smia", "Sumia"],["Unit", "Betrayal", "Takumi"],["Unit", "Pineapple", "Takumi"],
        ["Unit", "Tacomeme", "Takumi"],["Unit", "Sallya", "Tharja"],["Unit", "Sariya", "Tharja"],["Unit", "Sarya", "Tharja"],["Unit", "Chiki", "Tiki"],
        ["Unit", "Vake", "Vaike"],["Unit", "Veiku", "Vaike"],["Unit", "Wyck", "Vaike"],["Unit", "Velour", "Velouria"],["Unit", "Viaur", "Virion"],
        ["Unit", "Viole", "Virion"],["Unit", "Vioru", "Virion"],["Unit", "Marx", "Xander"],["Unit", "Chambray", "Yarne"],["Unit", "Shanbure", "Yarne"],
        ["Unit", "Annie", "Annette Fantine Dominic"],["Unit", "Bernadetta", "Bernie"],["Unit", "BernadettavonVarley", "Bernie"],
        ["Unit", "Hubie", "Hubert von Vestra"],["Unit", "Lindhart", "Linhardt von Hevring"],["Unit", "Linhart", "Linhardt von Hevring"],
        ["Unit", "Lyndhart", "Linhardt von Hevring"],["Unit", "Lynhardt", "Linhardt von Hevring"],["Unit", "Lynhart", "Linhardt von Hevring"],
        ["Unit", "Mariana", "Marianne von Edmund"],["Unit", "Mariane", "Marianne von Edmund"],["Unit", "Marianna", "Marianne von Edmund"],
        ["Unit", "Edie", "Edelgard von Hresvelg"],["Unit", "Lin", "Linhardt von Hevring"],["Unit", "Ferdie", "Ferdinand von Aegir"],
        ["Unit", "Caspie", "Caspar von Bergliez"],["Class", "Invisible Dragon", "Silent Dragon"],["Class", "Familiar", "Empty Vessel"],
        ["Class", "Axe Fighter", "Fighter"],["Class", "Dark Prince", "Nohr Prince"],["Class", "Dark Princess", "Nohr Princess"],
        ["Class", "Dark Royal", "Nohr Royal"],["Class", "Dark Blood", "Nohr Noble"],["Class", "Light Blood", "Hoshido Noble"],
        ["Class", "Dragon Knight", "Wyvern Rider"],["Class", "Dragon Master", "Wyvern Lord"],["Class", "Revanant Knight", "Malig Knight"],
        ["Class", "Rod Knight", "Troubadour"],["Class", "Singer", "Songstress"],["Class", "Golem", "Stoneborn"],["Class", "Dark Lord", "Nohrian King"],
        ["Class", "Dark Dragon", "Blight Dragon"]]
@predetermined_parents=[["Azura","Shigure"],["Jakob","Dwyer"],["Ryoma","Shiro"],["Takumi","Kiragi"],["Hinata","Hisame"],["Saizo","Asugi"],
                        ["Xander","Siegbert"],["Leo","Forrest"],["Benny","Ignatius"],["Arthur","Percy"],["Kaze","Midori"],["Silas","Sophie"],
                        ["Subaki","Caeldori"],["Azama","Mitama"],["Kaden","Selkie"],["Hayato","Rhajat"],["Niles","Nina"],["Odin","Ophelia"],
                        ["Keaton","Velouria"],["Laslow","Soliel"],["Chrom","Lucina"],["Cordelia","Severa"],["Lissa","Owain"],["Sully","Kjelle"],
                        ["Miriel","Laurent"],["Panne","Yarne"],["Nowi","Nah"],["Tharja","Noire"],["Olivia","Inigo"],["Cherche","Gerome"],
                        ["Bluezie","Elentil"],["Dizzy","DizJr"],["Rudyard","Gaotora"],["Megan","Portia"],["Steel","Fauna"],["Draco","Oregano"],
                        ["GSO","Ocarina"],["Cherche","Gerome"],["Erich","Synn"],["Dwight","Gella"],["Sheldon","Xavier"]]
@gay_canon=["Niles","Linhardt","Linhardt von Hevring","Edelgard","Edelgard von Hresvelg","Dorothea","Dorothea Arnault","Mercedes","Mercedes von Martritz",
            "Megan"]
@units=[]
@skills=[]
@supports=[]
@items=[]
@classes=[]
@crests=[]
@combat_arts=[]
@homo_servers=[]
@incest_servers=[]
@server_data2=[]
@ignored=[]
@spam_channels=[]
@embedless=[]
@last_bday=0

def all_commands(include_nil=false,permissions=-1)
  k=['gay','homosexuality','homo','sibling','incest','wincest','bugreport','suggestion','feedback','invite','proc','addreference','addalias','unit','character',
     'class','skill','marry','item','weapon','job','data','levelup','offspringseal','childseal','offspring','sendannouncement','getchannels','snagstats',
     'reboot','help','sendpm','ignoreuser','sendmessage','leaveserver','stats','backupaliases','sortaliases','deletealias','checkaliases','aliases','embeds',
     'snagchannels','shard','alliance','restorealiases','chara','char','donate','donation','find','search','sort','list','saliases','serveraliases','bday',
     'birthday','safe','spam','safetospam','safe2spam','longreplies','channellist','long','channelist','spamlist','spamchannels','prefix','birthdays','bdays',
     'status','avvie','avatar','level','ability','abil','marriage','support','crest','combat','art','arts','combatart','combatarts']
  if permissions==0
    k=all_commands(false)-all_commands(false,1)-all_commands(false,2)
  elsif permissions==1
    k=['addalias','deletealias','removealias','prefix']
  elsif permissions==2
    k=['reboot','restorealiases','backupaliases','sendpm','ignoreuser','sendmessage','leaveserver','cleanupaliases','setmarker','snagchannels','reload']
  end
  k.unshift(nil) if include_nil
  return k
end

def data_load()
  # UNIT DATA
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FEUnits.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FEUnits.txt").each_line do |line|
      b.push(line)
    end
  else
    b=[]
  end
  for i in 0...b.length
    b[i]=b[i].split('\\'[0]).reject{|q| q=="\n"}
    b[i][3]=b[i][3].split(', ').map{|q| q.to_i}
    b[i][4]=b[i][4].split(', ').map{|q| q.to_i}
    b[i][5]=b[i][5].split(', ')
    b[i][5]=b[i][5].map{|q| q.to_i} if b[i][1][2]=='T'
    b[i][6]=b[i][6].split(', ')
    b[i][8]=b[i][8].split('/').map{|q| q.to_i} unless b[i][8].nil? || b[i][8].length<=1
    b[i][9]=b[i][9].split(', ') unless b[i][9].nil? || b[i][9].length<=0
    b[i][10]=b[i][10].split(', ') unless b[i][10].nil? || b[i][10].length<=0
    b[i][11]=b[i][11].split(', ') unless b[i][11].nil? || b[i][11].length<=0
  end
  @units=b.map{|q| q}
  # CLASS DATA
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FEClasses.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FEClasses.txt").each_line do |line|
      b.push(line)
    end
  else
    b=[]
  end
  for i in 0...b.length
    b[i]=b[i].split('\\'[0]).reject{|q| q=="\n"}
    b[i][3]=b[i][3].split(', ').map{|q| q.to_i}
    b[i][4]=b[i][4].split(', ').map{|q| q.to_i}
    b[i][5]=b[i][5].split(', ').map{|q| q.to_i}
    b[i][7]=b[i][7].split(', ')
    b[i][8]=b[i][8].split(', ') unless b[i][8].nil?
    b[i][9]=b[i][9].split('; ').map{|q| q.split(', ').map{|q2| q2.gsub("\n",'')}} unless b[i][9].nil?
  end
  @classes=b.map{|q| q}
  # SKILL DATA
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FESkills.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FESkills.txt").each_line do |line|
      b.push(line)
    end
  else
    b=[]
  end
  for i in 0...b.length
    b[i]=b[i].gsub("\n",'').split('\\'[0])
    unless b[i][2]=='-'
      b[i][2]=b[i][2].split('; ').map{|q| q.split(', ')}
      for j in 0...b[i][2].length
        b[i][2][j][1]=b[i][2][j][1].to_i if b[i][2][j][1].to_i.to_s==b[i][2][j][1]
      end
    end
  end
  @skills=b.map{|q| q}
  # ITEM DATA
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FEItems.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FEItems.txt").each_line do |line|
      b.push(line)
    end
  else
    b=[]
  end
  for i in 0...b.length
    b[i]=b[i].gsub("\n",'').split('\\'[0])
    b[i][2]=b[i][2].split(', ')
    b[i][3]=nil if b[i][3].length<=0
    b[i][4]=b[i][4].split(', ')
    for j in 0...b[i][4].length
      b[i][4][j]=b[i][4][j].to_i if b[i][4][j].to_i.to_s==b[i][4][j]
    end
    b[i][6]=b[i][6].split(', ')
    b[i][6][0]=b[i][6][0].to_i if b[i][6][0].to_i.to_s==b[i][6][0]
  end
  @items=b.map{|q| q}
  # CREST DATA
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FECrests.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FECrests.txt").each_line do |line|
      b.push(line)
    end
  else
    b=[]
  end
  for i in 0...b.length
    b[i]=b[i].gsub("\n",'').split('\\'[0])
    b[i][2]=b[i][2].split(', ').map{|q| q.to_i}
  end
  @crests=b.map{|q| q}
  # COMBAT ART DATA
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FECombatArts.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FECombatArts.txt").each_line do |line|
      b.push(line.gsub("\n",''))
    end
  else
    b=[]
  end
  for i in 0...b.length
    b[i]=b[i].gsub("\n",'').split('\\'[0])
    b[i][2]=b[i][2].split(', ')
  end
  @combat_arts=b.map{|q| q}
  # SUPPORT DATA
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FESupports.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FESupports.txt").each_line do |line|
      b.push(line.gsub("\n",''))
    end
  else
    b=[]
  end
  @supports=b.map{|q| q.split('\\'[0])}
end

def prefixes_save()
  x=@prefixes
  open("C:/Users/#{@mash}/Desktop/devkit/FEPrefix.rb", 'w') { |f|
    f.puts x.to_s.gsub('=>',' => ').gsub(', ',",\n  ").gsub('{',"@prefixes = {\n  ").gsub('}',"\n}")
  }
end

def nicknames_load()
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FENames.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FENames.txt").each_line do |line|
      b.push(eval line)
    end
  else
    b=[["Unit","Ana","Anna"],["Unit","Harold","Arthur"],["Unit","Gurei","Asugi"],["Unit","Asama","Azama"],["Unit","Aqua","Azura"],["Unit","Bajirio","Basilio"],
       ["Unit","Benoit","Benny"],["Unit","Berka","Beruka"],["Unit","Bredy","Brady"],["Unit","Buredi","Brady"],["Unit","Matoi","Caeldori"],
       ["Unit","Riceload","Caeldori"],["Unit","Serge","Cherche"],["Unit","Seruju","Cherche"],["Unit","Zelcher","Cherche"],["Unit","Krom","Chrom"],
       ["Unit","Kuromu","Chrom"],["Unit","Tiamo","Cordelia"],["Unit","Kamui","Corrin"],["Unit","Shinshia","Cynthia"],["Unit","Denis","Donnel"],
       ["Unit","Doni","Donnel"],["Unit","Donny","Donnel"],["Unit","Deere","Dwyer"],["Unit","Elfie","Effie"],["Unit","CinnamonRoll","Elise"],
       ["Unit","Emelina","Emmeryn"],["Unit","Emerina","Emmeryn"],["Unit","Furavia","Flavia"],["Unit","Foleo","Forrest"],["Unit","Frederik","Frederick"],
       ["Unit","Furederiku","Frederick"],["Unit","Fuuga","Fuga"],["Unit","Gaia","Gaius"],["Unit","Guire","Gaius"],["Unit","Jerome","Gerome"],
       ["Unit","Jeromu","Gerome"],["Unit","Grego","Gregor"],["Unit","Gurego","Gregor"],["Unit","Gunther","Gunter"],["Unit","Kazahana","Hana"],
       ["Unit","Tsukuyomi","Hayato"],["Unit","Henri","Henry"],["Unit","Ignis","Ignatius"],["Unit","Azur","Inigo"],["Unit","Azure","Inigo"],
       ["Unit","Azuru","Inigo"],["Unit","Joker","Jakob"],["Unit","Nishiki","Kaden"],["Unit","Kagerou","Kagero"],["Unit","Kanna","Kana"],
       ["Unit","Suzukaze","Kaze"],["Unit","Flannel","Keaton"],["Unit","Callum","Kellam"],["Unit","Karamu","Kellam"],["Unit","Kisaragi","Kiragi"],
       ["Unit","Degel","Kjelle"],["Unit","Dejeru","Kjelle"],["Unit","Lazward","Laslow"],["Unit","Loran","Laurent"],["Unit","Roran","Laurent"],
       ["Unit","Leon","Leo"],["Unit","Libera","Libra"],["Unit","Ribera","Libra"],["Unit","Riviera","Libra"],["Unit","Liz","Lissa"],["Unit","Rizu","Lissa"],
       ["Unit","Lon'zu","Lon'qu"],["Unit","Lonqu","Lon'qu"],["Unit","Lonzu","Lon'qu"],["Unit","Ronku","Lon'qu"],["Unit","Ronkuu","Lon'qu"],
       ["Unit","Rukina","Lucina"],["Unit","Mariabel","Maribelle"],["Unit","Mariabell","Maribelle"],["Unit","Mariaberu","Maribelle"],
       ["Unit","Midoriko","Midori"],["Unit","Mirieru","Miriel"],["Unit","Linfan","Morgan"],["Unit","Maku","Morgan"],["Unit","Marc","Morgan"],
       ["Unit","Mark","Morgan"],["Unit","Mozume","Mozu"],["Unit","n_n","Nah"],["Unit","Nn","Nah"],["Unit","Zero","Niles"],["Unit","Eponine","Nina"],
       ["Unit","Noir","Noire"],["Unit","Nowaru","Noire"],["Unit","Nono","Nowi"],["Unit","Olivie","Olivia"],["Unit","Orivie","Olivia"],["Unit","Eudes","Owain"],
       ["Unit","Udo","Owain"],["Unit","Wood","Owain"],["Unit","Berubetto","Panne"],["Unit","Palne","Panne"],["Unit","Velvet","Panne"],["Unit","Lutz","Percy"],
       ["Unit","Pieri","Peri"],["Unit","Paris","Priam"],["Unit","Parisu","Priam"],["Unit","Yuugiri","Reina"],["Unit","Syalla","Rhajat"],
       ["Unit","Licht","Ricken"],["Unit","Richt","Ricken"],["Unit","Rihito","Ricken"],["Unit","Rinka","Rinkah"],["Unit","Daraen","Robin"],
       ["Unit","Reflet","Robin"],["Unit","Rufure","Robin"],["Unit","Lobster","Ryoma"],["Unit","Ryouma","Ryoma"],["Unit","Saizou","Saizo"],
       ["Unit","Sairi","Say'ri"],["Unit","Sayri","Say'ri"],["Unit","Crimson","Scarlet"],["Unit","Luna","Selena"],["Unit","Kinu","Selkie"],
       ["Unit","Selena","Severa"],["Unit","Serena","Severa"],["Unit","Shinonome","Shiro"],["Unit","Asyura","Shura"],["Unit","Sort","Stahl"],
       ["Unit","Soru","Stahl"],["Unit","Tsubaki","Subaki"],["Unit","Soiree","Sully"],["Unit","Soware","Sully"],["Unit","Smia","Sumia"],
       ["Unit","Betrayal","Takumi"],["Unit","Pineapple","Takumi"],["Unit","Tacomeme","Takumi"],["Unit","Sallya","Tharja"],["Unit","Sariya","Tharja"],
       ["Unit","Sarya","Tharja"],["Unit","Chiki","Tiki"],["Unit","Vake","Vaike"],["Unit","Veiku","Vaike"],["Unit","Wyck","Vaike"],["Unit","Velour","Velouria"],
       ["Unit","Viaur","Virion"],["Unit","Viole","Virion"],["Unit","Vioru","Virion"],["Unit","Marx","Xander"],["Unit","Chambray","Yarne"],
       ["Unit","Shanbure","Yarne"],["Class","Axe Fighter","Fighter"],["Class","Dark Prince","Nohr Prince"],["Class","Dark Princess","Nohr Princess"],
       ["Unit","Annie","Annette Fantine Dominic"],["Unit","Bernadetta","Bernie"],["Unit","BernadettavonVarley","Bernie"],
       ["Unit","Hubie","Hubert von Vestra"],["Unit","Lindhart","Linhardt von Hevring"],["Unit","Linhart","Linhardt von Hevring"],
       ["Unit","Lyndhart","Linhardt von Hevring"],["Unit","Lynhardt","Linhardt von Hevring"],["Unit","Lynhart","Linhardt von Hevring"],
       ["Unit","Mariana","Marianne von Edmund"],["Unit","Mariane","Marianne von Edmund"],["Unit","Marianna","Marianne von Edmund"],
       ["Unit","Edie","Edelgard von Hresvelg"],["Unit","Lin","Linhardt von Hevring"],["Unit","Ferdie","Ferdinand von Aegir"],
       ["Unit","Caspie","Caspar von Bergliez"],["Class","Invisible Dragon","Silent Dragon"],["Class","Familiar","Empty Vessel"],
       ["Class","Dark Royal","Nohr Royal"],["Class","Dark Blood","Nohr Noble"],["Class","Light Blood","Hoshido Noble"],["Class","Rod Knight","Troubadour"],
       ["Class","Dragon Knight","Wyvern Rider"],["Class","Dragon Master","Wyvern Lord"],["Class","Revanant Knight","Malig Knight"],
       ["Class","Singer","Songstress"],["Class","Golem","Stoneborn"],["Class","Dark Lord","Nohrian King"],["Class","Dark Dragon","Blight Dragon"]]
  end
  @names=b.uniq
end

def metadata_load()
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FESave.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FESave.txt").each_line do |line|
      b.push(eval line)
    end
  else
    b=[[168592191189417984, 256379815601373184],[],[[0,0,0,0,0],[0,0,0,0,0]],[],[]]
  end
  @embedless=b[0]
  @embedless=[168592191189417984, 256379815601373184] if @embedless.nil?
  @ignored=b[1]
  @ignored=[] if @ignored.nil?
  @server_data2=b[2]
  @server_data2=[[0,0,0,0,0],[0,0,0,0,0]] if @server_data2.nil?
  @homo_servers=b[3]
  @homo_servers=[] if @homo_servers.nil?
  @incest_servers=b[4]
  @incest_servers=[] if @incest_servers.nil?
end

def metadata_save()
  x=[@embedless.map{|q| q}, @ignored.map{|q| q}, @server_data2.map{|q| q}, @homo_servers.map{|q| q}, @incest_servers.map{|q| q}]
  open("C:/Users/#{@mash}/Desktop/devkit/FESave.txt", 'w') { |f|
    f.puts x[0].to_s
    f.puts x[1].to_s
    f.puts x[2].to_s
    f.puts x[3].to_s
    f.puts x[4].to_s
    f.puts "\n"
  }
end

def safe_to_spam?(event,chn=nil) # determines whether or not it is safe to send extremely long messages
  return true if event.server.nil? # it is safe to spam in PM
  return false if event.message.text.downcase.split(' ').include?('smol') && @shardizard==4
  return true if @shardizard==4
  return true if [443172595580534784,443181099494146068,443704357335203840,449988713330769920,497429938471829504,554231720698707979,508792801455243266,508793141202255874,508793425664016395,523821178670940170,523830882453422120,691616574393811004,523824424437415946,523825319916994564,523822789308841985,532083509083373579,575426885048336388].include?(event.server.id) # it is safe to spam in the emoji servers
  chn=event.channel if chn.nil?
  return true if ['bots','bot'].include?(chn.name.downcase) # channels named "bots" are safe to spam in
  return true if chn.name.downcase.include?('bot') && chn.name.downcase.include?('spam') # it is safe to spam in any bot spam channel
  return true if chn.name.downcase.include?('bot') && chn.name.downcase.include?('command') # it is safe to spam in any bot spam channel
  return true if chn.name.downcase.include?('bot') && chn.name.downcase.include?('channel') # it is safe to spam in any bot spam channel
  return true if chn.name.downcase.include?('feindex') # it is safe to spam in channels designed specifically for FEIndex
  return true if chn.name.downcase.include?('fe-index')
  return true if chn.name.downcase.include?('fe_index')
  return true if chn.name.downcase.include?('robinbot') # it is safe to spam in channels designed specifically for FEIndex
  return true if chn.name.downcase.include?('robin-bot')
  return true if chn.name.downcase.include?('robin_bot')
  return true if @spam_channels.include?(chn.id)
  return false
end

bot.command(:reboot, from: 167657750971547648) do |event|
  return nil if overlap_prevent(event)
  return nil unless event.user.id==167657750971547648
  puts 'FE!reboot'
  exec "cd C:/Users/#{@mash}/Desktop/devkit && RobinBot.rb #{@shardizard}"
end

bot.command([:help,:commands,:command_list,:commandlist,:Help]) do |event, command, subcommand|
  help_text(event,bot,command,subcommand)
end

def help_text(event,bot,command=nil,subcommand=nil)
  command="" if command.nil?
  if ['help','commands','command_list','commandlist'].include?(command.downcase)
    event.respond "The `#{command.downcase}` command displays this message:"
    command=''
  end
  game=game_proc(event)
  xcolor=0x02010a
  xcolor=avg_color([0x061069,0xC5EEF2,0x2D6864])
  xcolor=0x061069 if game=='Awakening'
  xcolor=0xC5EEF2 if game=='Fates'
  xcolor=0x2D6864 if game=='Three Houses'
  if command.downcase=="mode"
    create_embed(event,"__***Awakening*** **mode**__","- Forced by using the command prefixes `FEA!` `FEA?` `FE13!` `FE13?`\n- Kids' growths are calculated via (mom + dad + kid default)/3\n- Kids inherit all classes from their variable parent\n- Lucina is a second-generation unit\n- Robin is an avatar character, which can be edited by including stats in your message\n- Anna is a Trickster.  The Outlaw and Noble Annas can still be invoked via the strings 'Fates!Anna' and '3H!Anna'\n- Corrin shows with default stats\n- Available proc skills include: Aether, Astra, Lethality, Sol, Luna, Ignis, and Vengeance\n- Vengeance procs at (Skill*2)%",0x061069)
    create_embed(event,"__***Fates*** **mode**__","- Forced by using the command prefixes `FEF!` `FEF?` `FE14!` `FE14?`\n- Kids' growths are calculated via (variable parent + kid default)/2\n- Kids inherit only their variable parent's first new class\n- Lucina is an Amiibo character and treated as a first-gen unit\n- Robin is an Amiibo character\n- Anna is an Outlaw.  The Trickster and Noble Annas can still be invoked via the strings 'Awakening!Anna' and '3H!Anna'\n- Corrin is an avatar character, which can be edited by including stats in your message\n- Available proc skills include: Aether, Astra, Lethality, Sol, Luna, Ignis, Dragon Fang, Rend Heaven and Vengeance\n- Vengeance procs at (Skill*3/2)%",0xC5EEF2)
    create_embed(event,"__***Three Houses*** **mode**__","- Forced by using the command prefixes `3H!` `3H?` `FE16!` `FE16?`\n- Lucina is an Amiibo character and treated as a first-gen unit\n- Robin is an avatar character, which can be edited by including stats in your message\n- Anna is a Noble.  The Trickster and Outlaw Annas can still be invoked via the strings 'Awakening!Anna' and 'Fates!Anna'\n- Corrin is an avatar character, which can be edited by including stats in your message\n- No proc skills are available",0x2D6864)
    create_embed(event,"__**Fluid mode**__","- Forced by using the command prefixes `FE!` `FE?`#{" `#{@prefixes[event.server.id]}`" if !event.server.nil? && !@prefixes[event.server.id].nil? && @prefixes[event.server.id].length>0}\n- Lucina defaults to being an Amiibo character, but becomes a second-gen unit if a first-gen unit is listed alongside her\n- Robin is an Amiibo character, unless stats are included in your message and you are not invoking Kana\n- Anna defaults to being a Noble.  'Fates!Anna' and 'Awakening!Anna' can be used to distinguish\n- Corrin is shown with default stats, unless stats are included in your message and you are not invoking Morgan\n- Kids will be calculated via the mode that matches their game of origin, regardless of the game of origin of the variable parent (this means that when calculating Felicia!Lucina!Kana, Felicia!Lucina will be calculated in *Awakening* mode and the result would be used in a *Fates* mode calculation as the mother of a female Kana)\n- When using the `data` command to find a character's growths in a class that is in multiple games, the version from the game the character originates from will be used\n- When using the `class` command to look at a class that exists in multiple games, all applicable versions will be displayed\n- When using the `item`/`weapon` command to look at a weapon that exists in multiple games, all applicable versions will be displayed\n- When using the `skill` command to look at a skill that exists in multiple games and behaves differently in each, all applicable versions will be displayed",0x010101)
  elsif ['status','avatar','avvie'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}**","Shows my current avatar, status, and reason for such.\n\nWhen used by my developer with a message following it, sets my status to that message.",0xD49F61)
  elsif ['prefix'].include?(command.downcase)
    create_embed(event,'**prefix** __new prefix__',"Sets the server's custom prefix to `prefix`.\n\n**This command can only be used by server mods.**",0xC31C19)
  elsif ['embed','embeds'].include?(command.downcase)
    event << "**embed**"
    event << ''
    event << "Toggles whether I post as embeds or plaintext when the invoker triggers a response from me.  By default, I display embeds for everyone."
    event << "This command is useful for people who, in an attempt to conserve phone data, disable the automatic loading of images, as this setting also affects their ability to see embeds."
    unless @embedless.include?(event.user.id) || was_embedless_mentioned?(event)
      event << ''
      event << "This help window is not in an embed so that people who need this command can see it."
    end
    return nil
  elsif ['find','search','list','sort'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __\*filters__","Displays all units that fit `filters`.\n\nYou can search by:\n- Game of origin\n- Generation\n- Gender\n\nIf too many units are trying to be displayed, I will - for the sake of the sanity of other server members - only allow you to use the command in PM.",0x010101)
  elsif command.downcase=='reboot'
    create_embed(event,'**reboot**',"Reboots this shard of the bot, installing any updates.\n\n**This command is only able to be used by Rot8er_ConeX**",0x008b8b)
  elsif command.downcase=='sendmessage'
    create_embed(event,'**sendmessage** __channel id__ __*message__',"Sends the message `message` to the channel with id `channel`\n\n**This command is only able to be used by Rot8er_ConeX**, and only in PM.",0x008b8b)
  elsif command.downcase=='sendpm'
    create_embed(event,'**sendpm** __user id__ __*message__',"Sends the message `message` to the user with id `user`\n\n**This command is only able to be used by Rot8er_ConeX**, and only in PM.",0x008b8b)
  elsif command.downcase=='ignoreuser'
    create_embed(event,'**ignoreuser** __user id__',"Causes me to ignore the user with id `user`\n\n**This command is only able to be used by Rot8er_ConeX**, and only in PM.",0x008b8b)
  elsif command.downcase=='sortaliases'
    create_embed(event,"**#{command.downcase}**","Sorts the alias list alphabetically by unit the alias is for.\n\n**This command is only able to be used by Rot8er_ConeX**.",0x008b8b)
  elsif command.downcase=='leaveserver'
    create_embed(event,'**leaveserver** __server id number__',"Forces me to leave the server with the id `server id`.\n\n**This command is only able to be used by Rot8er_ConeX**, and only in PM.",0x008b8b)
  elsif command.downcase=='snagstats'
    subcommand='' if subcommand.nil?
    if ['server','servers','member','members','shard','shards','users','user'].include?(subcommand.downcase)
      create_embed(event,"**#{command.downcase} #{subcommand.downcase}**",'Returns the number of servers and unique members each shard reaches.',0x40C0F0)
    elsif ['alts','alt','alternate','alternates','alternative','alternatives'].include?(subcommand.downcase)
      create_embed(event,"**#{command.downcase} #{subcommand.downcase}**",'Returns the number of units within each type of alt, as well as specifics about characters with the most alts.',0x40C0F0)
    elsif ['unit','char','character','units','chars','charas','chara'].include?(subcommand.downcase)
      create_embed(event,"**#{command.downcase} #{subcommand.downcase}**","Returns the number of units sorted in each of the following ways:\nGeneration (in PM)\nGender\nGame of Origin",0x40C0F0)
    elsif ['class','classes'].include?(subcommand.downcase)
      create_embed(event,"**#{command.downcase} #{subcommand.downcase}**","Returns the number of classes sorted in each of the following ways:\nGame of origin\nCountry of origin (in PM)",0x40C0F0)
    elsif ['skills','skill','ability','abilities','abilitys'].include?(subcommand.downcase)
      create_embed(event,"**#{command.downcase} #{subcommand.downcase}**","Returns the number of skills sorted in each of the following ways:\nGame of origin\nMethod of obtaining the skill",0x40C0F0)
    elsif ['item','items','weapons','weapon'].include?(subcommand.downcase)
      create_embed(event,"**#{command.downcase} #{subcommand.downcase}**","Returns the number of items sorted in each of the following ways:\nGame of origin\nWeapon type (in PM)\nWeapon rank required (in PM)\nAvailablity",0x40C0F0)
    elsif ['alias','aliases','name','names','nickname','nicknames'].include?(subcommand.downcase)
      create_embed(event,"**#{command.downcase} #{subcommand.downcase}**","Returns the number of aliases in each of the two categories - global and server-specific.\nAlso returns specifics about the most frequent instances of each category",0x40C0F0)
    elsif ['code','lines','line','sloc'].include?(subcommand.downcase)
      create_embed(event,"**#{command.downcase} #{subcommand.downcase}**","Returns the specifics about my code, including number of commands and functions, as well as - if in PM - loops, statements, and conditionals.",0x40C0F0)
    else
      create_embed(event,"**#{command.downcase}**","Returns:\n- the number of servers I'm in\n- the numbers of units, classes, skills, and items in the games\n- the numbers of aliases I keep track of\n- how long of a file I am.\n\nYou can also include the following words to get more specialized data:\nServer(s), Member(s), Shard(s), User(s)\nUnit(s), Character(s), Char(a)(s)\nAlt(s)\nSkill(s)\nAlias(es), Name(s), Nickname(s)\nCode, Line(s), SLOC#{"\n\nAs the bot developer, you can also include a server ID number to snag the shard number, owner, and my nickname in the specified server." if event.user.id==167657750971547648}",0x40C0F0)
    end
  elsif command.downcase=='shard'
    create_embed(event,'**shard**',"Returns the shard that this server is served by.",0x40C0F0)
  elsif ['bugreport','suggestion','feedback'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __*message__","PMs my developer with your username, the server, and the contents of the message `message`",0x40C0F0)
  elsif command.downcase=='invite'
    create_embed(event,'**invite**',"PMs the invoker with a link to invite me to their server.",0x40C0F0)
  elsif ['unit','char','chara','character'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __name1__ __name2__ __name3__","parses the names listed to create a unit, whose stats are then displayed\nIf one unit is listed, displays that unit's default stats\nIf two units are listed, uses the first-gen to create a specialized kid\nIf three units are listed, uses the first-gen to create a specialized second-gen which is used to create a super-specialized Kana/Morgan\n\nUnits can be listed in any order.  The command will arrange them correctly.\nIf multiple units from the same generation are listed, the command will use the first listed and ignore all others\n\nIncluding the word \"Aptitude\" in your inputs will calculate the unit's growths as if they had the skill Aptitude",xcolor)
  elsif ["shard","alliance"].include?(command.downcase)
    create_embed(event,'**shard**',"Returns the shard that this server is served by, labeled as if it was an alliance between a country in *Awakening* with a country in *Fates*.",xcolor)
  elsif ['backupaliases'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __item__","Backs up the alias list.\n\n**This command is only able to be used by Rot8er_ConeX**.",xcolor)
  elsif ['restorealiases'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __item__","Restores the the alias list.\n\n**This command is only able to be used by Rot8er_ConeX**.",xcolor)
  elsif command.downcase=="class"
    create_embed(event,"**class** __name__","displays the stats of the named class\n\nThis command informs you if you do not list a class.\n\nIncluding the word \"Aptitude\" in your inputs will calculate the unit's growths as if they had the skill Aptitude",xcolor)
  elsif ["data","job","stats"].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** (string)","This command interprets the rest of your message as a single string whose beginning and end are searched for up to three character names and the remainder is assumed to be the name of a class\nFunctionally, this means that you can type out three names and a class, in any order\n`FE!#{command.downcase} Maid Corrin` is as valid as `FE!#{command.downcase} Corrin Maid`\n`FE!#{command.downcase} Sniper Azura Kiragi Kana` is as valid as `FE!#{command.downcase} Kiragi Azura Sniper Kana`\n\nSimilar to the `unit` command, this command figures out the generational order of the units listed and uses that to calculate the most accurate child.  If only one unit is listed, then the command uses that unit's default data.\nThe resulting unit is given the class specified, and the stats are displayed.\n\nIf no class is specified, this command is functionally identical to the `unit` command.\nIf no units are specified, this command is functionally identical to the `class` command.\nIf no class or units are specified, this command informs you of your mistake.\n\nIncluding the word \"Aptitude\" in your inputs will calculate the unit's growths as if they had the skill Aptitude",xcolor)
  elsif ['levelup','level'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** (string)","Much like the *data* command, this command parses the string into up to three unit names and a class name, which are then parsed together.\nThe result is then used to display a sample level-up, accounting for the combined growth rates.\n\nIf no unit is listed, uses just the class's growths\nIf no class is listed, uses just the unit's growths\nNeither of the above possibilities will result in complete levels\n\nIncluding the word \"Aptitude\" in your message will adjust probability accordingly",xcolor)
  elsif ["offspringseal","childseal","offspring"].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** (string)","Much like the *data* command, this command parses the string into up to three unit names, a class name, and a number\nNumbers between 1 and 18 are interpreted as a level to promote to, and numbers between 19 and 27 are interpreted as a chapter before which you use the seal\nThe level 20 (base class) child is then promoted to the resulting level using an Offspring Seal.\n\nIf no unit is listed, uses just the class's growths\nIf no class is listed, uses just the unit's growths\nNeither of the above possibilities will result in complete levels\n\nIncluding the word \"Aptitude\" in your message will adjust growths (and therefore stat increases) accordingly",xcolor)
  elsif ['skill','ability','abil'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __name__","Shows data on the skill/ability `name`, including what class or character learns it, and the trigger rate, if applicable",xcolor)
  elsif ['combat','art','arts','combatart','combatarts'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __name__","Shows data on the combat art `name`.",xcolor)
  elsif ['crest'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __name__","Shows data on the Crest `name`, including what units have it and what weapons/items are associated with it.\n\nNames of units with Crests, and items associated with Crests, can be used as inputs as well, and the output will be the proper Crest.",xcolor)
  elsif ["item","weapon"].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __name__","Shows data on the item `name`, including the price, range, and hit rate, if applicable.",xcolor)
  elsif ["homosexuality","homo","gay"].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __state__","Sets the homosexuality filter to `state`.\nIf `state` is not defined, toggles the current setting.\n\n**Allowed words**: On/Off, true/false, yes/no.",xcolor)
  elsif ["incest","wincest","sibling"].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __state__","Sets the incest filter to `state`.\nIf `state` is not defined, toggles the current setting.\n\n**Allowed words**: On/Off, true/false, yes/no.",xcolor)
  elsif ['aliases','checkaliases','seealiases','alias'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __unit__","Responds with a list of all `unit`'s aliases.\nIf no unit is listed, responds with a list of all aliases and who they are for.\n\nPlease note that if more than 50 aliases are to be listed, I will - for the sake of the sanity of other server members - only allow you to use the command in PM.",xcolor)
  elsif ['deletealias','removealias'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __alias__","Removes `alias` from the list of aliases, regardless of who/what it was for.\n\n**This command can only be used by server mods.**",0xC31C19)
  elsif ['bday','birthday','bdays','birthdays'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}**","Shows a list of unit birthdays, sorted by how soon they will come up.\n\nIn PM, shows the entire calendar.\nElsewhere, shows only the next eight for each game.\n\nIf a server mod follows this command with \"announce\", I will post announcements in the channel on characters' birthdays, at 4 A.M. U.S. Central Time.  (Limit one channel per server)\nIf I already post such announcements in the channel, server mods can follow this command with \"off\" to turn them off.",xcolor)
  elsif command.downcase=='addalias'
    create_embed(event,'**addalias** __new alias__ __unit__',"Adds `new alias` to `name`'s aliases.\nIf the arguments are listed in the opposite order, the command will auto-switch them.\n\nAliases can be added to:\n- Units\n- Classes\n- Skills\n- Items/Weapons\n\nInforms you if the alias already belongs to someone/something.\nAlso informs you if the unit you wish to give the alias to does not exist.\n\n**This command can only be used by server mods.**",0xC31C19)
  elsif ['marry','marriage','support'].include?(command.downcase)
    create_embed(event,"**#{command.downcase}** __name1__ __name2__","If at least one of the listed units is from *Awakening* or *Fates*, shows what the Partner Seal options would be for `name1` and `name2` if they were to marry each other.\nAlso shows the resulting children.\n\nIf all listed names are from *Three Houses*, shows you all the support chains that will get in the way of attaining `name1`'s paired ending with `name2`.\nIf only one unit is listed, and they are from *Three Houses*, this command shows the priority for their paired endings.",xcolor)
  elsif "proc"==command.downcase
    create_embed(event,"**proc** __stat__ __list of skills__","Shows the likelihood of each of the listed skills proc'ing, given a unit's Skill stat is `stat`.\nIncluding the skills 'Hoshidan Unity' and/or 'Quixotic' will increases chances accordingly.\nIncluding the skill 'Nohrian Trust' allows you to have more than five skills listed.\n\nIf no Skill stat is listed, shows a random number between 1 and 64.\nIf no proc skills are listed, shows the list as if you have all possible proc skills.\n\nUsing a negative number as the Skill stat, crossing out one or more skill names, or including the word 'not' in your message will change the command to Reverse Mode.\nIn Reverse Mode, the listed skills will be *excluded* from the list of all proc skills, and the result will be the list of skills you have.",xcolor)
  else
    x=0
    x=1 unless safe_to_spam?(event)
    if command.downcase=='here'
      x=0
      command=''
    end
    event.respond("#{command.downcase} is not a command.") if command != ""
    str="__**Stats**__"
    str="#{str}\n`unit` __name1__ __name2__ __name3__ - to calculate a unit's bases without class (*also `character`*)"
    str="#{str}\n`class` __class name__ - to show a class's stats without a unit"
    str="#{str}\n`data` __\\*args__ - to show what a unit's stats are in a class (*also `job`*)"
    str="#{str}\n~~Adding the word \"aptitude\" to your inputs for the `unit`, `class`, and `data` commands will show the growths as if the unit had Aptitude~~"
    str="#{str}\n"
    str="#{str}\n`offspringseal` __\\*args__ - to show what happens when you use an Offspring Seal on the character (*also `childseal`*)" unless ["Awakening","Three Houses"].include?(game)
    str="#{str}\n`levelup` __\\*args__ - performs a level up on the unit"
    str="#{str}\n\n__**Other data**__"
    str="#{str}\n`skill` __skill name__ - to display info on skills"
    str="#{str}\n`item` __item name__ - to display info on items and weapons (*also `weapon`*)"
    unless ["Awakening","Fates"].include?(game)
      str="#{str}\n`crest` __Crest name__ - to display info on Crests"
      str="#{str}\n`combatart` __combat art name__ - to display info on Combat Arts"
    end
    str="#{str}\n\n`proc` __skill stat__ __\\*list of skills__ - to show proc probabilities"
    str="#{str}\n`marry` __name1__ __name2__ - to show what happens when units marry"
    str="#{str}\n`find` __\*filters__ - to search for units that fit specific criteria"
    str="#{str}\n`bday` - for a list of upcoming unit birthdays"
    str="#{str}\n\n__**Filter Settings**__"
    str="#{str}\n`homosexuality` __state__ - to decide if non-canon same-sex pairs are allowed (*also `gay` or `homo`*)"
    str="#{str}\n`incest` __state__ - to decide if sibling marriages are allowed (*also `wincest` or `sibling`*)"
    str="#{str}\n\n__**Developer Information**__"
    str="#{str}\n`bugreport` __\\*message__"
    str="#{str}\n`suggestion` __\\*message__"
    str="#{str}\n`feedback` __\\*message__"
    str="#{str}\n\n__**Meta Data**__"
    str="#{str}\n`shard` (*also `alliance`*)"
    create_embed([event,x],"**Command Prefixes**\n*Awakening* mechanics: `FEA!` `FEA?` `FE13!` `FE13?`\n*Fates* mechanics: `FEF!` `FEF?` `FE14!` `FE14?`\n*Three Houses* mechanics: `3H!` `3H?` `FE3H!` `FETH?` `FE16!` `FE16?`\nDetermine mechanics contextually: `FE!` `FE?`#{" `#{@prefixes[event.server.id]}`" if !event.server.nil? && !@prefixes[event.server.id].nil? && @prefixes[event.server.id].length>0}\n\nYou can also use \"`#{get_mode(event.message.text)}help` __command__\" to learn more about a specific command\nIn addition, you can use `#{get_mode(event.message.text)}help mode` to learn how the bot handles deciding between *Awakening* and *Fates* mechanics",str,xcolor)
    str="__**Aliases**__"
    str="#{str}\n`addalias` __new alias__ __target__ - Adds a new server-specific alias"
    str="#{str}\n~~`aliases` __target__ (*also `checkaliases` or `seealiases`*)~~"
    str="#{str}\n~~`serveraliases` __target__ (*also `saliases`*)~~"
    str="#{str}\n`deletealias` __alias__ (*also `removealias`*) - deletes a server-specific alias"
    str="#{str}\n\n__**Channels**__"
    str="#{str}\n`spam` __toggle__ - to allow the current channel to be safe to send long replies to (*also `safetospam` or `safe2spam`*)"
    create_embed([event,x],"__**Server Admin Commands**__",str,0xC31C19) if is_mod?(event.user,event.server,event.channel)
    str="__**Mjolnr, the Hammer**__"
    str="#{str}\n`ignoreuser` __user id number__ - makes me ignore a user"
    str="#{str}\n`leaveserver` __server id number__ - makes me leave a server"
    str="#{str}\n\n__**Communication**__"
    str="#{str}\n`sendpm` __user id number__ __\\*message__ - sends a PM to a user"
    str="#{str}\n`sendmessage` __channel id__ __\\*message__ - sends a message to a specific channel"
    str="#{str}\n\n__**Server Info**__"
    str="#{str}\n`snagstats` - snags server stats for multiple servers"
    str="#{str}\n\n__**Shards**__"
    str="#{str}\n`reboot` - reboots this shard"
    str="#{str}\n\n__**Meta Data Storage**__"
    str="#{str}\n`backupaliases` - backs up the alias list"
    str="#{str}\n`restorealiases` - restores the alias list from last backup"
    str="#{str}\n`sort` - sorts the alias list by type of alias"
    create_embed([event,x],"__**Bot Developer Commands**__",str,0x008b8b) if (event.server.nil? || command.downcase=='devcommands') && event.user.id==167657750971547648
    event.respond "If the you see the above message as only a few lines long, please use the command `#{get_mode(event.message.text)}embeds` to see my messages as plaintext instead of embeds.\n\n**Command Prefixes**\n*Awakening* mechanics: `FEA!` `FEA?` `FE13!` `FE13?`\n*Fates* mechanics: `FEF!` `FEF?` `FE14!` `FE14?`\n*Three Houses* mechanics: `3H!` `3H?` `FE3H!` `FETH?` `FE16!` `FE16?`\nDetermine mechanics contextually: `FE!` `FE?`#{" `#{@prefixes[event.server.id]}`" if !event.server.nil? && !@prefixes[event.server.id].nil? && @prefixes[event.server.id].length>0}\n\nYou can also use \"`#{get_mode(event.message.text)}help` __command__\" to learn more about a specific command\n\nWhen you wish to see data about a unit, class, item, or skill, you can also @ mention me in a message with that object's name in it." unless x==1
    event.user.pm("If the you see the above message as only a few lines long, please use the command `#{get_mode(event.message.text)}embeds` to see my messages as plaintext instead of embeds.\n\n**Command Prefixes**\n*Awakening* mechanics: `FEA!` `FEA?` `FE13!` `FE13?`\n*Fates* mechanics: `FEF!` `FEF?` `FE14!` `FE14?`\n*Three Houses* mechanics: `3H!` `3H?` `FE3H!` `FETH?` `FE16!` `FE16?`\nDetermine mechanics contextually: `FE!` `FE?`#{" `#{@prefixes[event.server.id]}`" if !event.server.nil? && !@prefixes[event.server.id].nil? && @prefixes[event.server.id].length>0}\n\nYou can also use \"`#{get_mode(event.message.text)}help` __command__\" to learn more about a specific command\n\nWhen you wish to see data about a unit, class, item, or skill, you can also @ mention me in a message with that object's name in it.") if x==1
    event.respond "A PM has been sent to you.\nIf you would like to show the help list in this channel, please use the command `FE!help here`." if x==1
  end
end

def overlap_prevent(event) # used to prevent servers with both Robin and her debug form from receiving two replies
  if event.server.nil? # failsafe code catching PMs as not a server
    return false
  elsif event.message.text.downcase.split(' ').include?('debug') && [443172595580534784,443704357335203840,443181099494146068,449988713330769920,497429938471829504,554231720698707979,523821178670940170,523830882453422120,691616574393811004,523824424437415946,523825319916994564,523822789308841985,532083509083373579,575426885048336388,572792502159933440].include?(event.server.id)
    return @shardizard != 4 # the debug bot can be forced to be used in the emoji servers by including the word "debug" in your message
  elsif [443172595580534784,443704357335203840,443181099494146068,449988713330769920,497429938471829504,554231720698707979,523821178670940170,523830882453422120,691616574393811004,523824424437415946,523825319916994564,523822789308841985,532083509083373579,575426885048336388,572792502159933440].include?(event.server.id) # emoji servers will use default Elise otherwise
    return @shardizard == 4
  end
  return false
end

def embed_color(path,game='Fates')
  data_load()
  if path[0,"*Fates*: Capturable boss in ".length]=="*Fates*: Capturable boss in "
    kid=path["*Fates*: Capturable boss in ".length,path.length-"*Fates*: Capturable boss in 's paralogue".length]
    path=@units[@units.find_index{|q| q[0]==kid}][2]
  end
  return 0x02010a if path.downcase.include?('cross-game')
  if game=='Awakening'
    return 0x061069 if path.downcase.include?('awakening')
  elsif game=='Fates'
    return 0xC5EEF2 if path.downcase.include?('available in all') || path.downcase.include?('dlc') || path.downcase.include?('amiibo') || path.downcase.include?('not obtainable')
    return 0x2DA5AF if path.downcase.include?('exclusive to *revelation*')
    return 0xCF000D if path.downcase.include?('exclusive to *birthright*') || path.downcase.include?('*birthright* exclusive') || path.downcase.include?('not available in *conquest*')
    return 0xAA7FCD if path.downcase.include?('exclusive to *conquest*') || path.downcase.include?('*conquest* exclusive') || path.downcase.include?('not available in *birthright*')
    return 0xBC4372 if path.downcase.include?('not available in *revelation*')
    return 0xFFEA8B if path.downcase.include?('gates')
  elsif game=='Three Houses'
    return 0x7D171F if path.downcase.include?('black eagles') || path.downcase=='exclusive to crimson flower'
    return 0x4B4E9B if path.downcase.include?('blue lions')
    return 0x897A04 if path.downcase.include?('golden deer')
    return 0x8A8D94 if path.downcase.include?('ashen wolves')
    return 0x565562 if path.downcase=='exclusive to azure moon' || path.downcase=='cutscene only' || path.downcase=='unavailable in crimson flower'
    return 0x2D6864
  end
  return 0x02010A
end

def embed_color_x(path,clss=nil,game='Fates')
  v=embed_color(path,game)
  if clss[2]=="Penumbra"
    return 0xFFEA8B
  elsif ["Wolfskin","Wolfssegner","Kitsune","Nine-Tails","Songstress","Hoshido Noble","Nohr Noble"].include?(clss[0])
    return 0x2DA5AF if clss[2]=="Hoshido" && (path.downcase.include?('exclusive to *conquest*') || path.downcase.include?('*conquest* exclusive') || path.downcase.include?('not available in *birthright*'))
    return 0x2DA5AF if clss[2]=="Nohr" && (path.downcase.include?('exclusive to *birthright*') || path.downcase.include?('*birthright* exclusive') || path.downcase.include?('not available in *conquest*'))
  elsif ['Adrestia','Faerghus','Leicester','Agartha'].include?(clss[2])
    return 0x2D6864 if ['Faerghus','Leicester'].include?(clss[2]) && path.downcase.include?('exclusive to *black eagles*')
    return 0x2D6864 if ['Adrestia','Leicester'].include?(clss[2]) && path.downcase.include?('exclusive to *blue lions*')
    return 0x2D6864 if ['Adrestia','Faerghus'].include?(clss[2]) && path.downcase.include?('exclusive to *golden deer*')
    return 0x2D6864 if clss[2]=='Agartha'
  end
  return v
end

def find_stats_in_string(event)
  args=splice(event)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) } # remove any mentions included in the inputs
  boon=nil
  bane=nil
  for i in 0...args.length
    if args[i][0,1]=='+'
      stat=args[i][1,args[i].length-1]
      boon="HP" if ["hp","health"].include?(stat) && boon.nil?
      boon="Str" if ["str","strength"].include?(stat) && boon.nil?
      boon="Mag" if ["mag","magic"].include?(stat) && boon.nil?
      boon="Skl" if ["skl","skill"].include?(stat) && boon.nil?
      boon="Spd" if ["spd","speed"].include?(stat) && boon.nil?
      boon="Lck" if ["lck","luck"].include?(stat) && boon.nil?
      boon="Def" if ["def","defense","defence"].include?(stat) && boon.nil?
      boon="Res" if ["res","resistance"].include?(stat) && boon.nil?
      args[i]=nil
    elsif args[i][0,1]=='-'
      stat=args[i][1,args[i].length-1]
      bane="HP" if ["hp","health"].include?(stat) && bane.nil?
      bane="Str" if ["str","strength"].include?(stat) && bane.nil?
      bane="Mag" if ["mag","magic"].include?(stat) && bane.nil?
      bane="Skl" if ["skl","skill"].include?(stat) && bane.nil?
      bane="Spd" if ["spd","speed"].include?(stat) && bane.nil?
      bane="Lck" if ["lck","luck"].include?(stat) && bane.nil?
      bane="Def" if ["def","defense","defence"].include?(stat) && bane.nil?
      bane="Res" if ["res","resistance"].include?(stat) && bane.nil?
      args[i]=nil
    elsif ["robust","strong","clever","deft","quick","lucky","defensive","defencive","sturdy","calm","sickly","weak","dull","clumsy","slow","unlucky","fragile","excitable"].include?(args[i])
      stat=args[i]
      boon="HP" if ["robust"].include?(stat) && boon.nil?
      boon="Str" if ["strong"].include?(stat) && boon.nil?
      boon="Mag" if ["clever"].include?(stat) && boon.nil?
      boon="Skl" if ["deft"].include?(stat) && boon.nil?
      boon="Spd" if ["quick"].include?(stat) && boon.nil?
      boon="Lck" if ["lucky"].include?(stat) && boon.nil?
      boon="Def" if ["defensive","defencive","sturdy"].include?(stat) && boon.nil?
      boon="Res" if ["calm"].include?(stat) && boon.nil?
      bane="HP" if ["sickly"].include?(stat) && bane.nil?
      bane="Str" if ["weak"].include?(stat) && bane.nil?
      bane="Mag" if ["dull"].include?(stat) && bane.nil?
      bane="Skl" if ["clumsy"].include?(stat) && bane.nil?
      bane="Spd" if ["slow"].include?(stat) && bane.nil?
      bane="Lck" if ["unlucky"].include?(stat) && bane.nil?
      bane="Def" if ["fragile"].include?(stat) && bane.nil?
      bane="Res" if ["excitable"].include?(stat) && bane.nil?
      args[i]=nil
    end
  end
  args.compact!
  for i in 0...args.length
    stat=args[i]
    stat="HP" if ["hp","health"].include?(stat)
    stat="Str" if ["str","strength"].include?(stat)
    stat="Mag" if ["mag","magic"].include?(stat)
    stat="Skl" if ["skl","skill"].include?(stat)
    stat="Spd" if ["spd","speed"].include?(stat)
    stat="Lck" if ["lck","luck"].include?(stat)
    stat="Def" if ["def","defense","defence"].include?(stat)
    stat="Res" if ["res","resistance"].include?(stat)
    if ["HP","Str","Mag","Skl","Spd","Lck","Def","Res"].include?(stat)
      if boon.nil?
        boon=stat
      elsif bane.nil?
        bane=stat
      end
    end
  end
  boon="" if boon.nil?
  bane="" if bane.nil?
  return [boon, bane, ">Talent<"]
end

def get_corrin(event,display=true,apt=0)
  data=find_stats_in_string(event)
  boon=get_boon("Fates",data[0])
  bane=get_bane("Fates",data[1])
  talent=[">talent<",">reverse talent<"]
  g=[45,45,30,40,45,45,35,25]
  m=[0,0,0,0,0,0,0,0]
  b=["HP","Strength","Magic","Skill","Speed","Luck","Defense","Resistance"]
  fullname="__**Corrin**__"
  if data[0]==""
    if data[1]==""
      desc="No boon or bane"
    else
      desc="No boon, -#{data[1]}"
    end
  elsif data[1]==""
    desc="+#{data[0]}, no bane"
  else
    desc="+#{data[0]}, -#{data[1]}"
  end
  text="*Fates*: Available in all routes\n**Personal Skill:** *Supportive* If this unit is supporting a lead unit with a support level of C or higher, lead unit receives +10 Hit, +2 damage dealt and -2 damage received in combat\n**Prf weapon:** *Yato* (in all its forms)\n**Can use Dragon Veins**, weak to dragon-effective weapons regardless of class"
  flds=[["Growth Rates",[]],["Modifiers",["-"]]]
  for i in 0...8
    g[i]=g[i]+boon[1][i]+bane[1][i]
    m[i]=m[i]+boon[0][i]+bane[0][i]
    flds[0][1].push("*#{b[i]}:*  #{g[i]+apt}%")
    flds[1][1].push("*#{b[i]}:*  #{"+" if m[i]>0}#{m[i]+apt}") if i>0
  end
  flds[0][1].push("")
  flds[1][1].push("")
  flds[0][1].push("*Total:*  #{g[0]+g[1]+g[2]+g[3]+g[4]+g[5]+g[6]+g[7]}%")
  flds[1][1].push("*Total:*  #{m[0]+m[1]+m[2]+m[3]+m[4]+m[5]+m[6]+m[7]}")
  flds[0][1]=flds[0][1].join("\n")
  flds[1][1]=flds[1][1].join("\n")
  flds.push(["Classes","*Default Class:* Nohr Royal (Hoshido Noble, Nohr Noble)\n*Heart Seal:* #{talent[0]}"])
  if display
    create_embed(event,fullname,text,0xC5EEF2,desc,nil,flds)
  else
    return [g,m,talent[0],"c",talent[1], data]
  end
end

def get_robin(event,display=true,apt=0)
  data=find_stats_in_string(event)
  boon=get_boon("Awakening",data[0])
  bane=get_bane("Awakening",data[1])
  g=[40,40,35,35,35,55,30,20]
  m=[0,0,0,0,0,0,0,0]
  b=["HP","Strength","Magic","Skill","Speed","Luck","Defense","Resistance"]
  fullname="__**Robin**__"
  if data[0]==""
    if data[1]==""
      desc="No boon or bane"
    else
      desc="No boon, -#{data[1]}"
    end
  elsif data[1]==""
    desc="+#{data[0]}, no bane"
  else
    desc="+#{data[0]}, -#{data[1]}"
  end
  text="*Awakening*"
  flds=[["Growth Rates",[]],["Modifiers",["-"]]]
  for i in 0...8
    g[i]=g[i]+boon[1][i]+bane[1][i]
    m[i]=m[i]+boon[0][i]+bane[0][i]
    flds[0][1].push("*#{b[i]}:*  #{g[i]+apt}%")
    flds[1][1].push("*#{b[i]}:*  #{"+" if m[i]>0}#{m[i]+apt}") if i>0
  end
  flds[0][1].push("")
  flds[1][1].push("")
  flds[0][1].push("*Total:*  #{g[0]+g[1]+g[2]+g[3]+g[4]+g[5]+g[6]+g[7]}%")
  flds[1][1].push("*Total:*  #{m[0]+m[1]+m[2]+m[3]+m[4]+m[5]+m[6]+m[7]}")
  flds[0][1]=flds[0][1].join("\n")
  flds[1][1]=flds[1][1].join("\n")
  if display
    bob5=["Cavalier (Paladin, Great Knight)","Knight (Great Knight, General)","Myrmidon (Swordmaster, Assassin)","Mercenary (Hero, Bow Knight)",
          "Archer (Sniper, Bow Knight)","Thief (Assassin, Trickster)","Wyvern Rider (Wyvern Lord, Griffon Rider)","Mage (Sage, Dark Knight)","Dark Mage (Sorcerer, Dark Knight)",
          "Healer (War Healer, Sage)"]
    flds.push(["Classes","*Default Class:* Tactician (Grandmaster)\n*Second Seal:* #{bob5.join(', ')}"])
    create_embed(event,fullname,text,0x061069,desc,nil,flds)
  else
    return [g,m,"",'c',"", data]
  end
end

def gender_adjust(clss,gender,singleclass=false,game="Fates")
  return nil if clss.nil?
  return "**Default Class:** #{gender_adjust(clss[19,clss.length-19],gender,singleclass,game)}" if clss[0,19]=="**Default Class:** "
  return "**Heart Seal:** #{gender_adjust(clss[16,clss.length-16],gender,singleclass,game)}" if clss[0,16]=="**Heart Seal:** "
  return "**Second Seal:** #{gender_adjust(clss[17,clss.length-17],gender,singleclass,game)}" if clss[0,17]=="**Second Seal:** "
  if singleclass
    fates_healers=["Shrine Maiden","Monk"]
    awakening_healers=["Priest"]
    fates_healers.push("Healer") if game=="Fates"
    awakening_healers.push("Healer") if game=="Awakening"
    awakening_healers.push("Cleric") if game=="Awakening"
    if clss[0,4]=="Nohr" && clss != "Nohr Noble"
      if gender=="m"
        return "Nohr Prince"
      elsif gender=="f"
        return "Nohr Princess"
      else
        return "Nohr Royal"
      end
    elsif clss[0,6]=="Taguel"
      return "Taguel (#{gender.upcase})"
    elsif fates_healers.include?(clss)
      if gender=="m"
        return "Monk"
      elsif gender=="f"
        return "Shrine Maiden"
      else
        return "Healer"
      end
    elsif ["Maid","Butler","Servant"].include?(clss)
      if gender=="m"
        return "Butler"
      elsif gender=="f"
        return "Maid"
      else
        return "Servant"
      end
    elsif ["Witch","Warlock","Great Sorcerer"].include?(clss)
      if gender=="m"
        return "Warlock"
      elsif gender=="f"
        return "Witch"
      else
        return "Great Sorcerer"
      end
    elsif ["Bride","Groom","Wedding Guest"].include?(clss)
      if gender=="m"
        return "Groom"
      elsif gender=="f"
        return "Bride"
      else
        return "Wedding Guest"
      end
    elsif awakening_healers.include?(clss)
      if gender=="m"
        return "Priest"
      elsif gender=="f"
        return "Cleric"
      else
        return "Healer"
      end
    elsif ["War Monk","War Cleric","War Healer"].include?(clss)
      if gender=="m"
        return "War Monk"
      elsif gender=="f"
        return "War Cleric"
      else
        return "War Healer"
      end
    elsif ["Battle Monk","Battle Cleric","Battle Healer"].include?(clss)
      if gender=="m"
        return "Battle Monk"
      elsif gender=="f"
        return "Battle Cleric"
      else
        return "Battle Healer"
      end
    elsif "Great Master"==clss && gender=="f"
      return "Great Mistress"
    elsif "Great Mistress"==clss && gender=="m"
      return "Great Master"
    elsif "Priestess"==clss && gender=="m"
      return "Great Priest"
    elsif "Great Priest"==clss && gender=="f"
      return "Priestess"
    else
      return clss
    end
  end
  if clss[0,4]=="Nohr"
    if gender=="m"
      return "Nohr Prince"
    elsif gender=="f"
      return "Nohr Princess"
    else
      return "Nohr Royal"
    end
  elsif clss[0,6]=="Taguel"
    return "Taguel (#{gender.upcase})"
  elsif clss[0,13]=="Shrine Maiden" || clss[0,4]=="Monk" || clss[0,15]=="Healer (Onmyoji"
    if gender=="m"
      return "Monk (Onmyoji, Great Master)"
    elsif gender=="f"
      return "Shrine Maiden (Onmyoji, Priestess)"
    else
      return "Healer (Onmyoji, Great Healer)"
    end
  elsif clss[0,6]=="Priest" || clss[0,6]=="Cleric" || clss[0,11]=="Healer (War"
    if gender=="m"
      return "Priest (War Monk, Sage)"
    elsif gender=="f"
      return "Cleric (War Cleric, Sage)"
    else
      return "Healer (War Healer, Sage)"
    end
  elsif clss[0,10]=="Troubadour" && !clss.include?("War")
    if gender=="m"
      return "Troubadour (Butler, Strategist)"
    elsif gender=="f"
      return "Troubadour (Maid, Strategist)"
    else
      return "Troubadour (Servant, Strategist)"
    end
  elsif clss[0,10]=="Troubadour"
    if gender=="m"
      return "Troubadour (War Monk, Valkyre)"
    elsif gender=="f"
      return "Troubadour (War Cleric, Valkyre)"
    else
      return "Troubadour (War Healer, Valkyre)"
    end
  elsif clss[0,5]=="Witch" || clss[0,7]=="Warlock" || clss[0,14]=="Great Sorcerer"
    if gender=="m"
      return "Warlock"
    elsif gender=="f"
      return "Witch"
    else
      return "Great Sorcerer"
    end
  elsif ["Bride","Groom","Wedding Guest"].include?(clss)
    if gender=="m"
      return "Groom"
    elsif gender=="f"
      return "Bride"
    else
      return "Wedding Guest"
    end
  else
    return clss
  end
end

def get_path(kid)
  data_load()
  k=kid.split('!')
  u=@units.find_index{|q| q[0]==k[k.length-1].gsub('*','')}
  u=@units.find_index{|q| q[0]==k[k.length-1].gsub('*','')[0,k[k.length-1].gsub('*','').length-1]} if u.nil?
  return @units[u][2]
end

def game_proc(event)
  game=""
  game="Awakening" if event.message.text[0,4].downcase=="fea!"
  game="Awakening" if event.message.text[0,5].downcase=="fe13!"
  game="Fates" if event.message.text[0,4].downcase=="fef!"
  game="Fates" if event.message.text[0,5].downcase=="fe14!"
  game="Three Houses" if event.message.text[0,3].downcase=="3h!"
  game="Three Houses" if event.message.text[0,5].downcase=="fe3h!"
  game="Three Houses" if event.message.text[0,5].downcase=="feth!"
  game="Three Houses" if event.message.text[0,5].downcase=="fe16!"
  game="Awakening" if event.message.text[0,4].downcase=="fea?"
  game="Awakening" if event.message.text[0,5].downcase=="fe13?"
  game="Fates" if event.message.text[0,4].downcase=="fef?"
  game="Fates" if event.message.text[0,5].downcase=="fe14?"
  game="Three Houses" if event.message.text[0,3].downcase=="3h?"
  game="Three Houses" if event.message.text[0,5].downcase=="fe3h?"
  game="Three Houses" if event.message.text[0,5].downcase=="feth?"
  game="Three Houses" if event.message.text[0,5].downcase=="fe16?"
  return game
end

def namecheck(name,event)
  game=game_proc(event)
  game="Fates" if game.length<=0
  return name if ["awakening!anna","fates!anna","3h!anna"].include?(name)
  if name.include?("!")
    b=[]
    name.each_line("!") {|l| b.push(l)}
    for i in 0...b.length
      b[i]=b[i][0,b[i].length-1] if i<b.length-1
    end
    b=b.reverse
    for i in b
      if find_unit(game,name,event)
        event.respond "#{name} as a whole is an invalid input.  Using just #{i}"
        return i
      end
    end
    event.respond "#{name} is an invalid input, and no valid names were found within."
    return nil
  else
    return name
  end
end

def find_twitter_icon(name)
  bob4=[]
  File.open("C:/Users/#{@mash}/Desktop/devkit/FETwitter.txt").each_line do |line|
    bob4.push(line[0,line.length-1])
  end
  for i in 0...bob4.length
    unless bob4[i].nil?
      return "0#{i}" if bob4[i].downcase==name.downcase && i<10
      return i if bob4[i].downcase==name.downcase
    end
  end
  return nil
end

def get_picture(kid,parent=nil,grandparent=nil,gender="",event=nil,ignore=false)
  pic=x_get_picture(kid,parent,grandparent,gender,event,ignore)
  pic=pic.gsub('https://inheritance-planner.herokuapp.com','') unless pic.nil?
  if pic != x_get_picture(kid,parent,grandparent,gender,event,ignore)
    Net::HTTP.start("inheritance-planner.herokuapp.com") { |http|
      resp = http.get("/images/characters/#{pic}")
      open("unit.jpg", "wb") { |file|
        file.write(resp.body)
      }
    }
    return ">no pic available<" if File.size('unit.jpg')<10
  end
  return x_get_picture(kid,parent,grandparent,gender,event,ignore)
end

def x_get_picture(kid,parent=nil,grandparent=nil,gender="",event=nil,ignore=false)
  if kid.downcase=="kana"[0,kid.length]
    kid="#{kid}#{gender}"
    return nil if !["m","f"].include?(gender)
  elsif kid.downcase=="shigure"[0,kid.length]
    "https://www.nintendo.co.jp/3ds/bfwj/twitter_icon/img/FEif_icon61.png"
  end
  unless grandparent.nil?
    if kid.downcase=="kanaf" && parent.downcase=="oregano" && grandparent.downcase=="camilla"
      return "http://orig11.deviantart.net/2c34/f/2017/097/e/2/double_dragon_by_rot8erconex-db4y52o.png"
    elsif kid.downcase=="kanaf" && parent.downcase=="oregano" && grandparent.downcase=="peri"
      return "http://orig00.deviantart.net/a9cb/f/2017/097/4/a/blood_dragon_by_rot8erconex-db4y52q.png"
    elsif kid.downcase=="kanaf" && grandparent.downcase=="camilla!oregano"
      return "http://orig11.deviantart.net/2c34/f/2017/097/e/2/double_dragon_by_rot8erconex-db4y52o.png"
    elsif kid.downcase=="kanaf" && grandparent.downcase=="peri!oregano"
      return "http://orig00.deviantart.net/a9cb/f/2017/097/4/a/blood_dragon_by_rot8erconex-db4y52q.png"
    elsif kid.downcase=="kanaf" && grandparent.downcase.include?("oregano")
      return "http://orig07.deviantart.net/45ec/f/2017/097/2/c/kitty_dragon_by_rot8erconex-db4y5r7.png"
    end
    grandparent=grandparent.gsub('Awakening!','').gsub('Fates!','')
  end
  unless parent.nil?
    if kid.downcase=="kanaf" && parent.downcase.include?("oregano") && grandparent.nil?
      return "http://orig07.deviantart.net/45ec/f/2017/097/2/c/kitty_dragon_by_rot8erconex-db4y5r7.png"
    end
    parent=parent.gsub('Awakening!','').gsub('Fates!','')
  end
  return get_picture("Anna",nil,nil,"f",event) if kid.gsub('**','')=="Fates!Anna"
  return "https://vignette3.wikia.nocookie.net/gfaqsfef/images/e/e2/Anna.jpg/revision/latest?cb=20160909202257" if kid.gsub('**','')=="Awakening!Anna"
  if kid.include?("!")
    b=[]
    kid.each_line("!") {|l| b.push(l)}
    for i in 0...b.length
      b[i]=b[i][0,b[i].length-1] if i<b.length-1
    end
    kid=nil
    parent=nil
    grandparent=nil
    kid=b[b.length-1] if b.length>0
    parent=b[b.length-2] if b.length>1
    grandparent=b[b.length-3] if b.length>2
    return get_picture(kid,parent,grandparent,gender,event)
  elsif !grandparent.nil? 
    if grandparent.include?("!")
      b=[]
      grandparent.each_line("!") {|l| b.push(l)}
      for i in 0...b.length
        b[i]=b[i][0,b[i].length-1] if i<b.length-1
      end
      return get_picture(kid,b[0],nil,gender,event)
    end
  end
  if !grandparent.nil?
    if ["Corrin","Robin"].include?(grandparent.downcase)
      grandparent=nil
    elsif get_picture(grandparent,nil,nil,"",event).nil?
      grandparent=nil
    elsif ["Corrin","Robin"].include?(parent.downcase)
      parent=grandparent
      grandparent=nil
    end
    unless grandparent.nil?
      grandparent=nil if grandparent.downcase=="rallyman"
    end
  elsif !parent.nil?
    if ["Corrin","Robin"].include?(parent.downcase)
      parent=nil
    elsif get_picture(parent,nil,nil,"",event).nil?
      parent=nil
    end
    unless parent.nil?
      parent=nil if parent.downcase=="rallyman"
    end
  end
  return "http://i1.kym-cdn.com/photos/images/original/001/111/164/349.png" if kid.downcase=="rallyman"
  return "http://pre12.deviantart.net/78d4/th/pre/f/2016/158/4/0/fe_oc_unit__bluezie_v2_by_bluechanxd-da5er6k.jpg" if kid.downcase=="bluezie"
  return "http://pre15.deviantart.net/6038/th/pre/f/2016/173/2/7/steel_unit_by_bluechanxd-da7a8yi.jpg" if kid.downcase=="steel"
  return "http://pre07.deviantart.net/dac9/th/pre/f/2016/174/5/c/fe_oc_unit__draco_by_bluechanxd-da7ehcm.jpg" if kid.downcase=="draco"
  return "http://pre00.deviantart.net/b9c6/th/pre/f/2016/175/0/0/fe_oc_unit__mathoo_by_bluechanxd-da7j799.jpg" if kid.downcase=="mathoo"
  return "http://orig10.deviantart.net/0cf8/f/2016/226/f/8/fe_oc_unit__dizzy_by_bluechanxd-dadxvza.jpg" if kid.downcase=="dizzy"
  return "http://orig10.deviantart.net/6b75/f/2016/316/c/1/fe_oc_unit__gaotora_by_bluechanxd-dao7e8q.jpg" if kid.downcase=="gaotora"
  return "http://orig09.deviantart.net/806c/f/2016/363/5/e/fe_oc_unit__elentil_v2_by_bluechanxd-datdki5.jpg" if kid.downcase=="elentil"
  return "http://pre14.deviantart.net/5d07/th/pre/f/2017/055/d/3/fe_oc_unit__erich_by_bluechanxd-db0a0e2.jpg" if kid.downcase=="erich"
  return "http://orig05.deviantart.net/862f/f/2017/055/d/0/fe_oc_unit__oregano_by_bluechanxd-db0a5m5.jpg" if kid.downcase=="oregano"
  return "http://pre07.deviantart.net/0778/th/pre/f/2016/151/2/7/aoi_by_bluechanxd-da4gxq1.jpg" if kid.downcase=="aoi"
  return "http://pre02.deviantart.net/9773/th/pre/f/2017/120/b/9/fe_oc_unit__synn_by_bluechanxd-db7nt23.jpg" if kid.downcase=="synn"
  return "http://orig07.deviantart.net/c0bc/f/2016/129/2/0/fe_oc_unit__rudyard_by_bluechanxd-da1wrmd.jpg" if kid.downcase=="rudyard"
  return "http://orig14.deviantart.net/e19f/f/2016/118/7/c/fe_oc_unit__gray_by_bluechanxd-da0lpx3.jpg" if kid.downcase=="gray"
  return "http://statici.behindthevoiceactors.com/behindthevoiceactors/_img/chars/robin-male-fire-emblem-awakening-2.06.jpg" if kid.downcase=="robin"
  return "https://cdn.discordapp.com/attachments/256291408598663168/293231273600745472/Sheldon.jpg" if kid.downcase=="sheldon"
  return "http://orig00.deviantart.net/6380/f/2015/155/c/9/marth_kakusei_portrait_by_psycho_blaze-d8w0wt8.jpg" if kid.downcase=="lucina" && rand(10).zero?
  return "https://fireemblemwiki.org/w/images/c/c7/Small_portrait_lucina_fe14.png" if kid.downcase=="lucina"
  return "http://vignette2.wikia.nocookie.net/fireemblem/images/8/8b/Ike_Fates_Portrait.png/revision/20161015035628" if kid.downcase=="ike"
  return "https://s-media-cache-ak0.pinimg.com/564x/70/7c/6d/707c6dd6c6eb4c1ab8207e752238670c.jpg" if kid.downcase=="marth"
  return "http://orig05.deviantart.net/d2bb/f/2017/066/0/e/sakura1_by_rot8erconex-db1iwub.png" if kid.downcase=="sakura" && event.user.id==167657750971547648
  if kid=="Kanam" && parent.nil?
    unless find_twitter_icon(kid).nil?
      return "https://www.nintendo.co.jp/3ds/bfwj/twitter_icon/img/FEif_icon_#{find_twitter_icon(kid)}.png"
    end
    return "https://inheritance-planner.herokuapp.com/images/characters/#{kid.downcase}.jpg"
  elsif kid=="Kanam" && parent=="Shigure"
    return "https://inheritance-planner.herokuapp.com/images/characters/children/Kanam/azura-kanam.jpg"
  elsif parent.nil? || kid=="Shigure"
    unless find_twitter_icon(kid).nil?
      return "https://www.nintendo.co.jp/3ds/bfwj/twitter_icon/img/FEif_icon_#{find_twitter_icon(kid)}.png"
    end
    return "https://inheritance-planner.herokuapp.com/images/characters/#{kid.downcase}.jpg"
  elsif grandparent.nil?
    p=get_path(kid)
    parent="Kaze" if parent.downcase=="midori"
    parent="Silas" if parent.downcase=="sophie"
    parent="Jakob" if parent.downcase=="dwyer"
    parent="Ryoma" if parent.downcase=="shiro"
    parent="Takumi" if parent.downcase=="kiragi"
    parent="Hinata" if parent.downcase=="hisame"
    parent="Xander" if parent.downcase=="siegbert"
    parent="Leo" if parent.downcase=="forrest"
    parent="Benny" if parent.downcase=="ignatius"
    parent="Arthur" if parent.downcase=="percy"
    parent="Selena" if parent.downcase=="caeldori"
    parent="Scarlet" if parent.downcase=="selkie"
    parent="Nyx" if parent.downcase=="rhajat"
    parent="Rinkah" if parent.downcase=="nina"
    parent="Scarlet" if parent.downcase=="ophelia"
    parent="Keaton" if parent.downcase=="velouria"
    parent="Felicia" if parent.downcase=="soliel"
    parent="Felicia" if parent.downcase=="mitama"
    parent="Hinoka" if parent.downcase=="asugi"
    parent="Oboro" if parent.downcase=="lucina"
    parent="Oboro" if parent.downcase=="marth"
    parent="Oboro" if parent.downcase=="ike"
    parent="Rinkah" if parent.downcase=="robin"
    parent="Anna" if ["awakening!anna","fates!anna","3h!anna","awakening","fates","3h"].include?(parent.downcase)
    parent="Azura" if parent.downcase=="flora" && kid.downcase != "kanaf"
    parent="Hinoka" if parent.downcase=="anna" && kid.downcase != "kanaf" && p == "Not available in *Conquest*" && kid.downcase != "caeldori" && kid.downcase != "hisame"
    parent="Selena" if parent.downcase=="anna" && kid.downcase != "kanaf"
    parent="Beruka" if parent.downcase=="reina" && kid.downcase != "kanaf" && p == "Not available in *Conquest*" && kid.downcase != "nina" && kid.downcase != "ignatius"
    parent="Oboro" if parent.downcase=="reina" && kid.downcase != "kanaf"
    parent="Rinkah" if parent.downcase=="scarlet" && kid.downcase != "kanaf" && (p == "Not available in *Conquest*" || kid.downcase=="forrest" || kid.downcase=="siegbert")
    parent="Elise" if parent.downcase=="scarlet" && kid.downcase != "kanaf"
    pic="children/#{kid}/#{parent.downcase}-#{kid.downcase}.jpg"
  else
    parent="Oboro" if grandparent.downcase=="lucina"
    parent="Oboro" if grandparent.downcase=="marth"
    parent="Oboro" if grandparent.downcase=="ike"
    parent="avatarm" if grandparent.downcase=="robin"
    pic="children/#{kid}/#{grandparent.downcase}-#{kid.downcase}.jpg"
  end
  File.delete('unit.jpg') if File.exist?('unit.jpg')
  Net::HTTP.start("inheritance-planner.herokuapp.com") { |http|
    resp = http.get("/images/characters/#{pic}")
    open("unit.jpg", "wb") { |file|
      file.write(resp.body)
    }
  }
  if File.size('unit.jpg')<100 && !ignore && !parent.nil?
    parent=grandparent if !grandparent.nil?
    if parent.downcase=="hinoka"
      parent="Selena"
    elsif parent.downcase=="selena"
      parent="Hinoka"
    end
    if parent.downcase=="rinkah"
      parent="Elise"
    elsif ["elise","charlotte","effie"].include?(parent.downcase)
      parent="Rinkah"
    end
    if parent.downcase=="camilla"
      parent="Orochi"
    elsif parent.downcase=="orochi"
      parent="Camilla"
    end
    parent="Azura" if parent.downcase=="beruka"
    parent="Mozu" if parent.downcase=="hana"
    parent="Felicia" if parent.downcase=="sakura"
    parent="Mozu" if parent.downcase=="kagero"
    parent="Orochi" if parent.downcase=="nyx"
    parent="Beruka" if parent.downcase=="setsuna"
    parent="Azura" if parent.downcase=="peri"
    parent="Nyx" if parent.downcase=="oboro"
    pic="children/#{kid}/#{parent.downcase}-#{kid.downcase}.jpg"
    Net::HTTP.start("inheritance-planner.herokuapp.com") { |http|
      resp = http.get("/images/characters/#{pic}")
      open("unit.jpg", "wb") { |file|
        file.write(resp.body)
      }
    }
    return ">no pic available<" if File.size('unit.jpg')<100
  end
  return "https://inheritance-planner.herokuapp.com/images/characters/#{pic}"
end

def x_find_class(name,event,game="",ignore=false)
  game=game_proc(event) if game==""
  return nil if name.nil?
  return nil if !name.is_a?(String)
  name=normalize(name)
  if name.downcase.gsub(' ','').gsub('_','')[0,2]=="<:"
    name=name.split(':')[1] unless x_find_class(name.split(':')[1],event,game).nil?
  end
  return nil if name.length<4
  data_load()
  # Match the class from the game first...
  for i in 0...@classes.length
    return @classes[i] if @classes[i][0].gsub(' ','').downcase==name.gsub(' ','').downcase && @classes[i][1]==game && ((!event.server.nil? && event.server.id==256291408598663168) || @classes[i][2]!="Penumbra")
  end
  nicknames_load()
  g=0
  g=event.server.id unless event.server.nil?
  alz=@names.reject{|q| q[0]!='Class'}.map{|q| [q[1],q[2],q[3]]}
  for i in alz
    if i[0].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
      x=x_find_class(i[1],event,game)
      return x if !x.nil? && x[1]==game
    end
  end
  unless ignore
    for i in 0...@classes.length
      return @classes[i] if @classes[i][0].gsub(' ','')[0,name.gsub(' ','').length].downcase==name.gsub(' ','').downcase && @classes[i][1]==game && ((!event.server.nil? && event.server.id==256291408598663168) || @classes[i][2]!="Penumbra")
    end
    for i in alz
      if i[0].gsub(' ','')[0,name.gsub(' ','').length].downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
        x=x_find_class(i[1],event,game)
        return x if !x.nil? && x[1]==game
      end
    end
  end
  # ...only if that fails try the class from another game
  for i in 0...@classes.length
    return @classes[i] if @classes[i][0].gsub(' ','').downcase==name.gsub(' ','').downcase && ((!event.server.nil? && event.server.id==256291408598663168) || @classes[i][2]!="Penumbra")
  end
  for i in alz
    return x_find_class(i[1],event,game) if i[0].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
    return x_find_class(i[1],event,game) if i[0].gsub('||','').gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
  end
  unless ignore
    for i in 0...@classes.length
      return @classes[i] if @classes[i][0].gsub(' ','')[0,name.gsub(' ','').length].downcase==name.gsub(' ','').downcase && ((!event.server.nil? && event.server.id==256291408598663168) || @classes[i][2]!="Penumbra")
    end
    for i in alz
      return x_find_class(i[1],event,game) if i[0].gsub(' ','')[0,name.gsub(' ','').length].downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
      return x_find_class(i[1],event,game) if i[0].gsub('||','').gsub(' ','')[0,name.gsub(' ','').length].downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
    end
  end
  return nil
end

def find_class(name,event,game="",ignore=false)
  return x_find_class(name,event,game,ignore) unless x_find_class(name,event,game,ignore).nil?
  if x_find_class(name,event,game,ignore).nil?
    args=name.split(' ')
    for i in 0...args.length
      return x_find_class(args[i,args.length-i].join(' '),event,game,ignore) unless x_find_class(args[i,args.length-i].join(' '),event,game,ignore).nil?
    end
  end
  return nil
end

def x_find_crest(name,event,ignore=false)
  return nil if name.nil?
  return nil if !name.is_a?(String)
  name=normalize(name)
  return nil if name.length<3
  if name.downcase.gsub(' ','').gsub('_','')[0,2]=="<:"
    name=name.split(':')[1] unless x_find_class(name.split(':')[1],event,game).nil?
  end
  data_load()
  for i in 0...@crests.length
    return @crests[i] if name.downcase.gsub(' ','')==@crests[i][0].downcase.gsub(' ','')
    return @crests[i] if name.downcase.gsub(' ','')==@crests[i][0].downcase.gsub('the ','').gsub(' ','')
  end
  return nil if ignore
  for i in 0...@crests.length
    return @crests[i] if name.downcase.gsub(' ','')==@crests[i][0].downcase.gsub(' ','')[0,name.length]
    return @crests[i] if name.downcase.gsub(' ','')==@crests[i][0].downcase.gsub('the ','').gsub(' ','')[0,name.length]
  end
  return nil
end

def find_crest(name,event,ignore=false)
  return x_find_crest(name,event,ignore) unless x_find_crest(name,event,ignore).nil?
  if x_find_crest(name,event,ignore).nil?
    args=name.split(' ')
    for i in 0...args.length
      return x_find_crest(args[i,args.length-i].join(' '),event,ignore) unless x_find_crest(args[i,args.length-i].join(' '),event,ignore).nil?
    end
  end
  return nil
end

def x_find_combat_art(name,event,ignore=false)
  return nil if name.nil?
  return nil if !name.is_a?(String)
  name=normalize(name)
  return nil if name.length<3
  if name.downcase.gsub(' ','').gsub('_','')[0,2]=="<:"
    name=name.split(':')[1] unless x_find_class(name.split(':')[1],event,game).nil?
  end
  data_load()
  for i in 0...@combat_arts.length
    return @combat_arts[i] if name.downcase.gsub(' ','')==@combat_arts[i][0].downcase.gsub(' ','')
  end
  return nil if ignore
  for i in 0...@combat_arts.length
    return @combat_arts[i] if name.downcase.gsub(' ','')==@combat_arts[i][0].downcase.gsub(' ','')[0,name.length]
  end
  return nil
end

def find_combat_art(name,event,ignore=false)
  return x_find_combat_art(name,event,ignore) unless x_find_combat_art(name,event,ignore).nil?
  if x_find_combat_art(name,event,ignore).nil?
    args=name.split(' ')
    for i in 0...args.length
      return x_find_combat_art(args[i,args.length-i].join(' '),event,ignore) unless x_find_combat_art(args[i,args.length-i].join(' '),event,ignore).nil?
    end
  end
  return nil
end

def find_overlap(route1,route2,parentname=nil)
  data_load()
  return "Cross-game child" if route1.include?('Awakening') && !route2.include?('Awakening')
  return "Cross-game child" if !route1.include?('Awakening') && route2.include?('Awakening')
  return "Cross-game child" if route1.include?('Black Eagles') || route1.include?('Blue Lions') || route1.include?('Golden Deer') || route1.include?('Ashen Wolves') || route1.include?('Azure Moon') || route1.include?('Crimson Flower') || route1.include?('Verdant Wind') || route1.include?('Silver Snow') || route1.include?('Cindered Shadows') || route1.downcase.include?('cutscene only')
  return "Cross-game child" if route2.include?('Black Eagles') || route2.include?('Blue Lions') || route2.include?('Golden Deer') || route2.include?('Ashen Wolves') || route2.include?('Azure Moon') || route2.include?('Crimson Flower') || route2.include?('Verdant Wind') || route2.include?('Silver Snow') || route2.include?('Cindered Shadows') || route2.downcase.include?('cutscene only')
  return "Cross-game child" if ['Byleth','Sothis','Jeritza von Hrym','Rhea','Shamir Nevrand'].include?(parentname)
  route2="Exclusive to *Conquest*" if parentname.downcase=="gunter"
  if ["DLC Character","Amiibo Character"].include?(route1)
    route1="Available in all routes"
  elsif ["*Birthright* exclusive capturable boss","*Birthright* exclusive capturable unit"].include?(route1)
    route1="Exclusive to *Birthright*"
  elsif ["*Conquest* exclusive capturable boss","*Conquest* exclusive capturable unit"].include?(route1)
    route1="Exclusive to *Conquest*"
  elsif route1[0,"Capturable boss in ".length]=="Capturable boss in "
    kid=route1["Capturable boss in ".length,route1.length-"Capturable boss in 's paralogue".length]
    route1=@units[@units.find_index{|q| q[0]==kid}][2]
  end
  if ["DLC Character","Amiibo Character"].include?(route2)
    route2="Available in all routes"
  elsif ["*Birthright* exclusive capturable boss","*Birthright* exclusive capturable unit"].include?(route2)
    route2="Exclusive to *Birthright*"
  elsif ["*Conquest* exclusive capturable boss","*Conquest* exclusive capturable unit"].include?(route2)
    route2="Exclusive to *Conquest*"
  elsif route2[0,"Capturable boss in ".length]=="Capturable boss in "
    kid=route2["Capturable boss in ".length,route2.length-"Capturable boss in 's paralogue".length]
    route2=@units[@units.find_index{|q| q[0]==kid}][2]
  end
  if route1=="Available in all routes"
    return route2
  elsif route2=="Available in all routes"
    return route1
  elsif route1==route2
    return route1
  elsif route1=="Not available in *Conquest*"
    if route2=="Not available in *Birthright*"
      return "Exclusive to *Revelation*"
    elsif route2=="Not available in *Revelation*"
      return "Exclusive to *Birthright*"
    elsif route2=="Exclusive to *Conquest*"
      return "Not obtainable"
    else
      return route2
    end
  elsif route2=="Not available in *Conquest*"
    if route1=="Not available in *Birthright*"
      return "Exclusive to *Revelation*"
    elsif route1=="Not available in *Revelation*"
      return "Exclusive to *Birthright*"
    elsif route1=="Exclusive to *Conquest*"
      return "Not obtainable"
    else
      return route1
    end
  elsif route1=="Not available in *Birthright*"
    if route2=="Not available in *Conquest*"
      return "Exclusive to *Revelation*"
    elsif route2=="Not available in *Revelation*"
      return "Exclusive to *Conquest*"
    elsif route2=="Exclusive to *Birthright*"
      return "Not obtainable"
    else
      return route2
    end
  elsif route2=="Not available in *Birthright*"
    if route1=="Not available in *Conquest*"
      return "Exclusive to *Revelation*"
    elsif route1=="Not available in *Revelation*"
      return "Exclusive to *Conquest*"
    elsif route1=="Exclusive to *Birthright*"
      return "Not obtainable"
    else
      return route1
    end
  elsif route1=="Not available in *Revelation*"
    if route2=="Not available in *Conquest*"
      return "Exclusive to *Birthright*"
    elsif route2=="Not available in *Birthright*"
      return "Exclusive to *Conquest*"
    elsif route2=="Exclusive to *Revelation*"
      return "Not obtainable"
    else
      return route2
    end
  elsif route2=="Not available in *Revelation*"
    if route1=="Not available in *Conquest*"
      return "Exclusive to *Birthright*"
    elsif route1=="Not available in *Birthright*"
      return "Exclusive to *Conquest*"
    elsif route1=="Exclusive to *Revelation*"
      return "Not obtainable"
    else
      return route1
    end
  else
    return "Not obtainable"
  end
end

def find_support(name1,name2,event)
  data_load()
  sup=@supports.map{|q| q}
  for i in 0...sup.length
    return sup[i] if sup[i][0]==name1 && sup[i][1]==name2
    return sup[i] if sup[i][0]==name2 && sup[i][1]==name1
  end
  return ['','','n']
end

def create_kid(event,kidname,parent,kanaboost=1,bold=true,display=true)
  data_load()
  # defaults to Fates mechanics, as they're easier to handle
  game=""
  # Forces mechanics to specific games based on the command prefix used
  game=game_proc(event)
  # If using the generic command prefixes, forces mechanics to be Awakening style if the kid is from Awakening, regardless of which game the parent is from
  if game==""
    f=find_unit(game,kidname,event)
    game="Awakening" if f[1][2,1]=='A' || kidname.downcase=="lucina"[kidname.length]
  end
  bob4=[]
  if parent.is_a?(Array)
    @mom=parent
  else
    @mom=find_unit(game,parent,event)
    xstats=find_stats_in_string(event)
    xgame=""
    xgame=game_proc(event)
    if parent.downcase=="corrin" && (xgame=="Fates" || (xgame != "Awakening" && (xstats[0].length>0 || xstats[1].length>0) && !mentions_avatar_kid(event,"Awakening")))
      momstuff=get_corrin(event,false)
      g=momstuff[0]
      m=momstuff[1]
      c=momstuff[2]
      c=">talent<" if c.nil?
      c=">talent<" if c.length<2
      @mom=["Corrin","1cFrD","Available in all routes",g,m,c,"",c,""]
    elsif parent.downcase=="robin" && (xgame=="Awakening" || (xgame != "Fates" && (xstats[0].length>0 || xstats[1].length>0) && !mentions_avatar_kid(event,"Fates")))
      momstuff=get_robin(event,false)
      g=momstuff[0]
      m=momstuff[1]
      c=momstuff[2]
      c=">talent<" if c.nil?
      c=">talent<" if c.length<2
      @mom=["Robin","1cA","*Awakening*",g,m,c,"",c,""]
    end
  end
  bob4=@units[@units.find_index{|q| q[0][0,kidname.length].downcase==kidname.downcase}]
  if kidname.downcase=="lucina"[0,kidname.length]
    bob4=find_unit("Awakening","Lucina",event)
  end
  kidname=bob4[0]
  @dad="Robin"
  for i in 0...@predetermined_parents.length
    @dad=@predetermined_parents[i][0] if kidname.downcase==@predetermined_parents[i][1].downcase
  end
  xstats=find_stats_in_string(event)
  xgame=""
  xgame=game_proc(event)
  if @dad.downcase=="robin" && (xgame=="Awakening" || (xgame != "Fates" && (xstats[0].length>0 || xstats[1].length>0) && !mentions_avatar_kid(event,"Fates")))
    momstuff=get_robin(event,false)
    g=momstuff[0]
    m=momstuff[1]
    c=momstuff[2]
    c=">talent<" if c.nil?
    c=">talent<" if c.length<2
    @dad=["Robin","1cA","Available in all routes",g,m,c,"",c,""]
  else
    @dad=find_unit(game,@dad,event)
  end
  if kidname.downcase=="kana"
    momstuff=get_corrin(event,false)
    m=momstuff[1]
    c=momstuff[2]
    c=">talent<" if c.nil?
    c=">talent<" if c.length<2
    c=gender_adjust(c,@mom[1][1,1])
    bob4[5][1]=c
    bob4[6][1]=c
    for i in 1...7
      bob4[4][i]=m[i]+kanaboost
    end
    bob4[1]="3#{@mom[1][1,1]}FrD"
  elsif kidname.downcase=="morgan"
    momstuff=get_robin(event,false)
    m=momstuff[1]
    for i in 1...7
      bob4[4][i]=m[i]+kanaboost
    end
    bob4[1]="3#{@mom[1][1,1]}A"
    if bob4[1][1,1]!="f" && bob4[1][1,1]!="m"
      bob5=[gender_adjust(@mom[6][0],bob4[1][1,1]),"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Healer","Archer","Thief","Wyvern Rider","Mage","Dark Mage"].uniq
    elsif bob4[1][1,1]=="m"
      bob5=[gender_adjust(@mom[6][0],bob4[1][1,1]),"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Barbarian","Archer","Thief","Wyvern Rider","Mage","Dark Mage","Priest","Fighter"].uniq
    else
      bob5=[gender_adjust(@mom[6][0],bob4[1][1,1]),"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Troubadour","Archer","Thief","Wyvern Rider","Mage","Dark Mage","Cleric","Pegasus Knight"].uniq
    end
    data_load()
    for i in 0...bob5.length
      m=@classes.find_index{|q| q[0]==bob5[i] && q[1]=='Awakening'}
      bob5[i]="#{bob5[i]} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0
    end
    bob4[5]=bob5.map{|q| q}
    special=["chrom","azura","olivia","walhart"]
    special.push("lucina") if @mom[2].include?("Awakening")
    if special.include?(@mom[0].downcase)
      bob4[5].unshift('Tactician (Grandmaster)')
      bob4[5].uniq!
    end
  elsif bob4[1][0,1].to_i<=@mom[1][0,1].to_i && !(bob4[0].include?("Portia") && @mom[0].include?("Oregano"))
    event.respond "#{@mom[0]} cannot be #{bob4[0]}'s parent.  Showing default #{bob4[0]}." if display
    return bob4
  elsif bob4[0]=="Portia"
  elsif bob4[1][0,1].to_i<=@mom[1][0,1].to_i
    event.respond "#{@mom[0]} cannot be #{bob4[0]}'s parent.  Showing default #{bob4[0]}." if display
    return bob4
  elsif ["Lucina"].include?(bob4[0]) && @mom[1][1,1]=="f" && !homosexuality_filter?(event)
    if @gay_canon.include?(@mom[0]) && @mom[1][2]!='A'
      event.respond "#{@mom[0]} cannot be #{bob4[0]}'s father, as same-sex marriages don't produce children.  Showing default #{bob4[0]}." if display
    else
      event.respond "#{@mom[0]} cannot be #{bob4[0]}'s father, as she already has one.  Showing default #{bob4[0]}." if display
    end
    return bob4
  elsif !["Lucina"].include?(bob4[0]) && @mom[1][1,1]=="m" && !homosexuality_filter?(event) && ['A'].include?(bob4[1][2])
    if @gay_canon.include?(@mom[0]) && @mom[1][2]!='A'
      event.respond "#{@mom[0]} cannot be #{bob4[0]}'s mother, as same-sex marriages don't produce children.  Showing default #{bob4[0]}." if display
    else
      event.respond "#{@mom[0]} cannot be #{bob4[0]}'s mother, as they already have one.  Showing default #{bob4[0]}." if display
    end
    return bob4
  elsif !@shigure_class_kids.include?(bob4[0]) && @mom[1][1,1]=="f" && !homosexuality_filter?(event) && ['F'].include?(bob4[1][2])
    if @gay_canon.include?(@mom[0]) && @mom[1][2]!='F'
      event.respond "#{@mom[0]} cannot be #{bob4[0]}'s mother, as same-sex marriages don't produce children.  Showing default #{bob4[0]}." if display
    else
      event.respond "#{@mom[0]} cannot be #{bob4[0]}'s mother, as they already have one.  Showing default #{bob4[0]}." if display
    end
    return bob4
  elsif @shigure_class_kids.include?(bob4[0]) && @mom[1][1,1]=="m" && !homosexuality_filter?(event) && ['F'].include?(bob4[1][2])
    if @gay_canon.include?(@mom[0]) && @mom[1][2]!='F'
      event.respond "#{@mom[0]} cannot be #{bob4[0]}'s father, as same-sex marriages don't produce children.  Showing default #{bob4[0]}." if display
    else
      event.respond "#{@mom[0]} cannot be #{bob4[0]}'s father, as they already have one.  Showing default #{bob4[0]}." if display
    end
    return bob4
  elsif bob4[1][2]=='F'
    bob4[1]="#{bob4[1]} " if bob4[1].length<=3
    bob4[1]="#{bob4[1].gsub('d','D')}" if bob4[1].length>4 && (@mom[0]=='Corrin' || @mom[1][4]=='D')
    bob4[1]="#{bob4[1]}D" if bob4[1].length<=4 && (@mom[0]=='Corrin' || @mom[1][4]=='D')
    bob4[1]="#{bob4[1]}d" if bob4[1].length<=4 && @mom[1][4]=='d'
  end
  if @mom[1][2]=='T'
    bst=0
    for i in 0...@mom[4].length
      bst+=@mom[4][i]
    end
    bst/=@mom[4].length
    @mom[4]=@mom[4].map{|q| q-bst+1}
  end
  data_load()
  for i in 0...bob4[5].length
    clss=bob4[5][i]
    clss=gender_adjust(clss,bob4[1][1,1])
    if clss[0,10]=='Troubadour'
      if game=='Awakening'
        bob4[5][i]='Troubadour (War Cleric, Valkyrie)'
      elsif bob4[1][1,1]=='m'
        bob4[5][i]='Troubadour (Butler, Strategist)'
      elsif bob4[1][1,1]=='f'
        bob4[5][i]='Troubadour (Maid, Strategist)'
      else
        bob4[5][i]='Troubadour (Servant, Strategist)'
      end
    else
      bob4[5][i]=clss
      m=@classes.find_index{|q| q[0]==clss && q[1][0,1]==bob4[1][2,1]}
      bob4[5][i]="#{clss} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0
    end
  end
  if (@mom[0].downcase=="Corrin" && game=="Fates") || @mom[6][0]=="Nohr Royal"
    if kidname.downcase=="kana"
      clss=bob4[5][1]
      clss=">talent<" if clss.nil?
      clss=">talent<" if clss.length<2
      clss2=gender_adjust(@mom[6][0],@mom[1][1,1])
      clss2=">talent<" if clss2.nil?
      clss2=">talent<" if clss2.length<2
      if clss==clss2
        clss2=gender_adjust(@mom[6][1],@mom[1][1,1])
        clss2=">parallel talent<" if clss2.nil?
        clss2=">parallel talent<" if clss2.length<2
      end
      bob4[5]=[clss, clss2]
    elsif kidname.downcase=="morgan"
    else
      bob4[5].push("#{gender_adjust("Nohr Royal",bob4[1][1,1])} (Hoshido Noble, Nohr Noble)")
    end
  elsif game=="Awakening" && (bob4[0]=="Morgan" || @mom[6][0]=="Tactician")
    if @mom[1][1,1]!="f" && @mom[1][1,1]!="m"
      bob5=[gender_adjust(@mom[6][0],bob4[1][1,1]),"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Healer","Archer","Thief","Wyvern Rider","Mage","Dark Mage"]
    elsif @mom[1][1,1]=="m"
      bob5=[gender_adjust(@mom[6][0],bob4[1][1,1]),"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Barbarian","Archer","Thief","Wyvern Rider","Mage","Dark Mage","Priest","Fighter"]
    else
      bob5=[gender_adjust(@mom[6][0],bob4[1][1,1]),"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Troubadour","Archer","Thief","Wyvern Rider","Mage","Dark Mage","Cleric","Pegasus Knight"]
    end
    if bob4[0]=='Morgan'
      special=["chrom","azura","olivia","walhart"]
      special.push("lucina") if @mom[2].include?("Awakening")
      bob5.shift if special.include?(@mom[0].downcase)
    else
      bob5.unshift(bob4[6][3]) unless bob4[6][3].nil?
      bob5.unshift(bob4[6][2]) unless bob4[6][2].nil?
      bob5.unshift(bob4[6][1]) unless bob4[6][1].nil?
      bob5.unshift(bob4[6][0]) unless bob4[6][0].nil?
    end
    bob5.uniq!
    data_load()
    for i in 0...bob5.length
      m=@classes.find_index{|q| q[0]==bob5[i] && q[1]=='Awakening'}
      bob5[i]="#{bob5[i]} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0
    end
    bob4[5]=bob5.map{|q| q}
  elsif game=="Awakening"
    data_load()
    for i in 0...@mom[6].length
      clss=@mom[6][i]
      if @mom[0]=="Vaike" && bob4[1][1,1]=="f"
        clss="Knight" if clss=="Fighter"
        clss="Mercenary" if clss=="Barbarian"
      elsif @mom[0]=="Donnel" && bob4[1][1,1]=="f"
        clss="Pegasus Knight" if clss=="Villager"
        clss="Troubadour" if clss=="Fighter"
      elsif @mom[0]=="Gaius" && bob4[1][1,1]=="f"
        clss="Pegasus Knight" if clss=="Fighter"
      elsif ["Gregor","Henry"].include?(@mom[0]) && bob4[1][1,1]=="f"
        clss="Troubadour" if clss=="Barbarian"
      elsif @mom[0]=="Lissa" && bob4[1][1,1]=="m"
        clss="Myrmidon" if clss=="Pegasus Knight"
        clss="Barbarian" if clss=="Mercenary"
      elsif @mom[0]=="Miriel" && bob4[1][1,1]=="m"
        clss="Barbarian" if clss=="Troubadour"
      elsif @mom[0]=="Maribelle" && bob4[1][1,1]=="m"
        clss="Cavalier" if clss=="Pegasus Knight"
        clss="Priest" if clss=="Troubadour"
      elsif @mom[0]=="Olivia" && bob4[1][1,1]=="m"
        clss="Barbarian" if clss=="Troubadour"
      elsif @mom[0]=="Cherche" && bob4[1][1,1]=="m"
        clss="Fighter" if clss=="Troubadour"
      elsif @mom[0]=="Panne" && bob4[1][1,1]=="m"
        clss="Barbarian" if clss=="Wyvern Rider"
      end
      clss=gender_adjust(clss,bob4[1][1,1])
      m=@classes.find_index{|q| q[0]==clss && q[1]=='Awakening'}
      clss="#{clss} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0
      clss=nil if !["Awakening","*Awakening*"].include?(@mom[2]) && @mom[1][0,1]=="1" && !["Anna","Gunter","Reina","Scarlet","Shura","Izana","Yukimura","Fuga"].include?(@mom[0]) && i==2
      bob4[5].push(clss) unless [bob4[6][0],bob4[6][1],bob4[6][2],"Dancer","Songstress","Conqueror"].include?(clss) || clss.nil?
    end
  else
    clss=gender_adjust(@mom[6][0],bob4[1][1,1])
    if bob4[0]=="Shigure" && @mom[0]=="Jakob"
      clss="Wyvern Rider"
    elsif [bob4[6][0],bob4[6][1]].include?(clss.split(' (')[0])
      clss=gender_adjust(@mom[6][1],bob4[1][1,1])
      clss=gender_adjust(@mom[6][2],bob4[1][1,1]) if [bob4[6][0],bob4[6][1]].include?(clss)
    end
    m=@classes.find_index{|q| q[0]==clss && q[1][0,1]==@mom[1][2,1]}
    clss="#{clss} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0
    bob4[5].push(clss)
    bob4[6].push(clss)
  end
  if @mom[1][2,1]=='T' && @mom[0].split(' ').length>1
    @mom[0]=@mom[0].split(' ')
    bob4[0]="#{bob4[0]} #{"#{@mom[0][@mom[0].length-2]} " if @mom[0][@mom[0].length-2]=='von'}#{@mom[0][@mom[0].length-1]}"
    @mom[0]=@mom[0][0]
  end
  if bold
    bob4[0]="#{@mom[0]}!**#{bob4[0]}**"
  else
    bob4[0]="#{@mom[0]}!#{bob4[0]}"
  end
  bob4[2]=find_overlap(bob4[2],@mom[2],@mom[0])
  for i in 0...8
    if game=="Awakening"
      bob4[3][i]=((bob4[3][i]+@mom[3][i]+@dad[3][i])/3.0).round
    else
      bob4[3][i]=((bob4[3][i]+@mom[3][i])/2.0).round
    end
    bob4[4][i]=bob4[4][i]+@mom[4][i] unless i==0
  end
  if kidname.downcase=="kana"
    bob4[5][0]=gender_adjust(bob4[5][0],bob4[1][1,1])
  end
  bob4[5].uniq!
  return bob4
end

def splice(event,str=nil)
  if str.nil?
    str=event.message.text.downcase.split(' ')
    unless str[0]=~/<@!?(?:\d+)>/
      str[0]=str[0].split('!')
      str[0][0]=nil
      str[0].compact!
      str[0]=str[0].join(' ')
      str[0]=nil if all_commands().include?(str[0])
      str.compact!
    end
    str=str.join(' ')
  end
  str=normalize(str)
  unless str[-1]=='+'
    str=str.split('+').map{|q| "+#{q}"}.join(' ')
    str=str[1,str.length-1]
  end
  str=str.split('-').map{|q| "-#{q}"}.join(' ')
  str=str[1,str.length-1]
  str=str.split(' ')
  return str
end

def reverse_stat(stat)
  return "-#{stat[1,stat.length-1]}" if stat[0,1]=="+"
  return "+#{stat[1,stat.length-1]}" if stat[0,1]=="-"
  return "robust" if stat.downcase=="sickly"
  return "strong" if stat.downcase=="weak"
  return "clever" if stat.downcase=="dull"
  return "deft" if stat.downcase=="clumsy"
  return "quick" if stat.downcase=="slow"
  return "lucky" if stat.downcase=="unlucky"
  return "sturdy" if stat.downcase=="fragile"
  return "calm" if stat.downcase=="excitable"
  return "charming" if stat.downcase=="revolting"
  return "sickly" if stat.downcase=="robust"
  return "weak" if stat.downcase=="strong"
  return "dull" if stat.downcase=="clever"
  return "clumsy" if stat.downcase=="deft"
  return "slow" if stat.downcase=="quick"
  return "unlucky" if stat.downcase=="lucky"
  return "fragile" if stat.downcase=="sturdy"
  return "fragile" if stat.downcase=="defensive"
  return "excitable" if stat.downcase=="calm"
  return "revolting" if stat.downcase=="charming"
  return stat
end

def get_child(name,gender,event)
  game=game_proc(event)
  game='Fates' if game.length<=0
  if name.downcase=="corrin" && ["Fates","Gates"].include?(game)
    return "Kana (#{gender})" if gender=="m" || gender=="f"
    return "Kana"
  elsif name.downcase=="robin" && game=="Awakening"
    return "Morgan (#{gender})" if gender=="m" || gender=="f"
    return "Morgan"
  end
  for i in 0...@predetermined_parents.length
    return @predetermined_parents[i][1] if name.downcase==@predetermined_parents[i][0].downcase
  end
  return nil
end

def forge(weapon,upgrade,game="Fates")
  if game=="Awakening"
    upgrade=[upgrade,5].min
    weapon[0]="#{weapon[0]} +#{upgrade}"
    weapon[4][0]="Anywhere between #{weapon[4][0].to_i} and #{weapon[4][0].to_i+upgrade}"
    weapon[4][1]="Anywhere between #{weapon[4][1].to_i} and #{weapon[4][1].to_i+5*upgrade}"
    weapon[4][2]="Anywhere between #{weapon[4][2].to_i} and #{weapon[4][2].to_i+3*upgrade}" if weapon[0]!="Ruin +#{upgrade}"
    return weapon
  end
  ups=[[0,0,0],[2,0,0],[4,2,0],[6,4,1],[8,6,3],[9,10,6],[10,15,10],[11,20,15]]
  if weapon[7].downcase.include?("cannot trigger crit") || weapon[7].downcase.include?("cannot crit") || weapon[7].downcase.include?("cannot double attack or inflict crit")
    ups=[[0,0,0],[2,0,0],[4,2,0],[6,5,0],[8,9,0],[9,15,0],[10,22,0],[11,30,0]]
  end
  weapon[0]="#{weapon[0]} +#{upgrade}"
  weapon[4][0]=weapon[4][0].to_i+ups[upgrade][0]
  weapon[4][1]=weapon[4][1].to_i+ups[upgrade][1]
  weapon[4][2]=weapon[4][2].to_i+ups[upgrade][2]
  if weapon[6][0]!="-"
    weapon[6][0]=weapon[6][0].to_i*(2**upgrade)
  end
  return weapon
end

def generation_parse(event,bob1=nil,bob2=nil,bob3=nil,bob4=nil,permerror=true)
  game=""
  game=game_proc(event)
  name1=bob1[0] if bob1
  name2=bob2[0] if bob2
  name3=bob3[0] if bob3
  name4=bob4[0] if bob4
  # Context clues for Lucina
  if game==""
    if name1=="Lucina"
      bob5=[[],[],[],[]]
      bob5[bob2[1][0,1].to_i].push(name2) if bob2
      bob5[bob3[1][0,1].to_i].push(name3) if bob3
      bob5[bob4[1][0,1].to_i].push(name4) if bob4
      bob1=find_unit("Awakening","Lucina",event) if bob5[2].length==0 && bob5[1].length>0
    end
    if name2=="Lucina"
      bob5=[[],[],[],[]]
      bob5[bob1[1][0,1].to_i].push(name1) if bob1
      bob5[bob3[1][0,1].to_i].push(name3) if bob3
      bob5[bob4[1][0,1].to_i].push(name4) if bob4
      bob2=find_unit("Awakening","Lucina",event) if bob5[2].length==0 && bob5[1].length>0
    end
    if name3=="Lucina"
      bob5=[[],[],[],[]]
      bob5[bob2[1][0,1].to_i].push(name2) if bob2
      bob5[bob1[1][0,1].to_i].push(name1) if bob1
      bob5[bob4[1][0,1].to_i].push(name4) if bob4
      bob3=find_unit("Awakening","Lucina",event) if bob5[2].length==0 && bob5[1].length>0
    end
    if name4=="Lucina"
      bob5=[[],[],[],[]]
      bob5[bob2[1][0,1].to_i].push(name2) if bob2
      bob5[bob3[1][0,1].to_i].push(name3) if bob3
      bob5[bob1[1][0,1].to_i].push(name1) if bob1
      bob4=find_unit("Awakening","Lucina",event) if bob5[2].length==0 && bob5[1].length>0
    end
  end
  ### parsing the inputs into generations ###
  if [name1,name2,name3,name4].include?("Portia") && [name1,name2,name3,name4].include?("Oregano") && [name1,name2,name3,name4].include?("Kana") && ![name1,name2,name3,name4].include?(nil)
    kidname = "Kana"
    mother = "Portia"
    grandmother = "#{name1}!Oregano" if !["Oregano","Portia","Kana"].include?(name1)
    grandmother = "#{name2}!Oregano" if !["Oregano","Portia","Kana"].include?(name2)
    grandmother = "#{name3}!Oregano" if !["Oregano","Portia","Kana"].include?(name3)
    grandmother = "#{name4}!Oregano" if !["Oregano","Portia","Kana"].include?(name4)
  elsif bob1.nil?
    if bob2.nil?
      if bob3.nil?
        # No input received
        event.respond("Please include a unit's name") if permerror
        return nil
      else
        # only name3 defined
        kidname = name3
        mother = nil
        grandmother = nil
      end
    elsif name3.nil?
      # only name2 defined
      kidname = name2
      mother = nil
      grandmother = nil
    else
      # name2 and name3 both defined but not name1
      if bob2[1][0,1].to_i>bob3[1][0,1].to_i
        kidname = name2
        mother = name3
        grandmother = nil
      elsif bob2[1][0,1].to_i<bob3[1][0,1].to_i
        kidname = name3
        mother = name2
        grandmother = nil
      elsif [name2,name3].include?("Portia") && [name2,name3].include?("Oregano")
        kidname = "Portia"
        mother = "Oregano"
        grandmother = nil
      else
        event.respond("#{name3} cannot be #{name2}'s parent.  Showing #{name2}'s default stats.")
        kidname = name2
        mother = nil
        grandmother = nil
      end
    end
  elsif bob2.nil?
    if bob3.nil?
      # only name1 defined
      kidname = name1
      mother = nil
      grandmother = nil
    else
      # name1 and name3 both defined but not name2
      if bob1[1][0,1].to_i>bob3[1][0,1].to_i
        kidname = name1
        mother = name3
        grandmother = nil
      elsif bob1[1][0,1].to_i<bob3[1][0,1].to_i
        kidname = name3
        mother = name1
        grandmother = nil
      elsif [name1,name3].include?("Portia") && [name1,name3].include?("Oregano")
        kidname = "Portia"
        mother = "Oregano"
        grandmother = nil
      else
        event.respond("#{name3} cannot be #{name1}'s parent.  Showing #{name1}'s default stats.")
        kidname = name1
        mother = nil
        grandmother = nil
      end
    end
  elsif bob3.nil?
    if bob2[1][0,1].to_i>bob1[1][0,1].to_i
      kidname = name2
      mother = name1
      grandmother = nil
    elsif bob2[1][0,1].to_i<bob1[1][0,1].to_i
      kidname = name1
      mother = name2
      grandmother = nil
    elsif [name2,name1].include?("Portia") && [name2,name1].include?("Oregano")
      kidname = "Portia"
      mother = "Oregano"
      grandmother = nil
    else
      event.respond("#{name2} cannot be #{name1}'s parent.  Showing #{name1}'s default stats.")
      kidname = name1
      mother = nil
      grandmother = nil
    end
  else
    # all three variables defined
    bob4=[[],[],[],[]]
    bob4[bob1[1][0,1].to_i].push(name1)
    bob4[bob2[1][0,1].to_i].push(name2)
    bob4[bob3[1][0,1].to_i].push(name3)
    if bob4[1].length>1
      if bob4[1].length>2
        # three first-gen units listed
        event.respond("More than one first-gen character listed.  Showing only #{name1}'s stats")
        kidname = name1
        mother = nil
        grandmother = nil
      elsif bob4[3].length.zero?
        # two first-gen units listed, one second-gen
        event.respond("More than one first-gen character listed.  Using #{bob4[1][0]} as #{bob4[2][0]}'s parent.")
        kidname = bob4[2][0]
        mother = bob4[1][0]
        grandmother = nil
      else
        # two first-gen units, and Kana
        event.respond("More than one first-gen character listed.  Using #{bob4[1][0]} as #{bob4[3][0]}'s parent.")
        kidname = bob4[3][0]
        mother = bob4[1][0]
        grandmother = nil
      end
    elsif bob4[2].length>1
      if bob4[2].include?("Portia") && bob4[2].include?("Oregano")
        if bob4[1].length>0
          # (mother)!Oregano!Portia
          kidname = "Portia"
          mother = "Oregano"
          grandmother = bob4[1][0]
        elsif bob4[3].length>0
          # Oregano!Portia!Kana
          kidname = bob4[3][0]
          mother = "Portia"
          grandmother = "Oregano"
        else
          event.respond "More than one second-gen character listed.  Showing Oregano!Portia"
          # Oregano!Portia
          kidname = "Portia"
          mother = "Oregano"
          grandmother = nil
        end
      elsif bob4[2].length>2
        # three second-gen units listed
        event.respond("More than one second-gen character listed.  Showing only #{name1}'s stats")
        kidname = name1
        mother = nil
        grandmother = nil
      elsif bob4[3].length.zero?
        # two second-gen units listed, one first-gen
        event.respond("More than one second-gen character listed.  Using #{bob4[2][0]} as #{bob4[1][0]}'s kid.")
        kidname = bob4[2][0]
        mother = bob4[1][0]
        grandmother = nil
      else
        # two second-gen units, and Kana
        event.respond("More than one second-gen character listed.  Using #{bob4[2][0]} as #{bob4[3][0]}'s parent.")
        kidname = bob4[3][0]
        mother = bob4[2][0]
        grandmother = nil
      end
    elsif bob4[3].length>1
      if bob4[3].length>2
        # three Kanas listed
        event.respond("Kana is listed thrice.  Using one Kana.")
        kidname = name1
        mother = nil
        grandmother = nil
      elsif bob4[2].length.zero?
        # two Kanas listed, one first-gen
        event.respond("Kana is listed twice.  Using one Kana.")
        kidname = bob4[3][0]
        mother = bob4[1][0]
        grandmother = nil
      else
        # two Kanas listed, one second-gen
        event.respond("Kana is listed twice.  Using one Kana.")
        kidname = bob4[3][0]
        mother = bob4[2][0]
        grandmother = nil
      end
    else
      # one character from each generation is used
      kidname = bob4[3][0]
      mother = bob4[2][0]
      grandmother = bob4[1][0]
    end
  end
  ### checking the legality of parentage ###
  if kidname=="Kana" && mother=="Corrin"
    event.respond("You cannot marry yourself!  Showing default Kana")
    mother=nil
  elsif kidname=="Morgan" && mother=="Robin"
    event.respond("You cannot marry yourself!  Showing default Morgan")
    mother=nil
  else
    for i in 0...@predetermined_parents.length
      if !grandmother.nil?
        if grandmother==@predetermined_parents[i][0] && mother==@predetermined_parents[i][1]
          bob2=find_unit(game,grandmother,event)
          g="them"
          g="him" if bob2[1][1,1]=="m"
          g="her" if bob2[1][1,1]=="f"
          if grandmother=="Megan"
            event.respond "If she goes unmarried, Megan will create Portia anyway; no need to specify Megan as the grandmother.  Showing default Portia as the mother." if permerror
          else
            event.respond "#{grandmother} cannot marry #{g}self; parthenogenesis is not a thing humans do.  Showing default #{mother} as the parent." if permerror
          end
          grandmother=nil
        end
      elsif !mother.nil?
        if mother==@predetermined_parents[i][0] && kidname==@predetermined_parents[i][1]
          bob2=find_unit(game,mother,event)
          g="them"
          g="him" if bob2[1][1,1]=="m"
          g="her" if bob2[1][1,1]=="f"
          if mother=="Megan"
            event.respond "If she goes unmarried, Megan will create Portia anyway; no need to specify Megan as the mother.  Showing default Portia." if permerror
          else
            event.respond "#{mother} cannot marry #{g}self; parthenogenesis is not a thing humans do.  Showing default #{kidname}." if permerror
          end
          mother=nil
        end
      end
    end
  end
  f=find_unit(game,kidname,event)
  if game==""
    game="Awakening" if ["Awakening","*Awakening*"].include?(f[2])
  end
  f2=find_unit(game,mother,event)
  if !homosexuality_filter?(event)
    if !grandmother.nil? && ['A'].include?(f2[1][2])
      if grandmother == "Robin" && kidname.downcase != "portia"
        # Robin as grandparent
        event.respond("#{grandmother} cannot be both Morgan's grandparent and parent.  Showing default #{mother}!#{kidname}")
        grandmother = nil
      elsif mother=="Portia"
      elsif ["Lucina"].include?(mother)
        # Lucina as the parent.  Grandparent must be female.
        bob1=find_unit(game,grandmother,event)
        if bob1[1][1,1]=="m" && !(@gay_canon.include?(bob1[0]) && bob1[1][2,1]!="A")
          bob2=find_unit(game,mother,event)
          g="they already have"
          g="he already has" if bob2[1][1,1]=="m"
          g="she already has" if bob2[1][1,1]=="f"
          event.respond("#{grandmother} cannot be #{mother}'s father, as #{g} one.  Showing default #{mother}!Morgan")
          grandmother = nil
        end
      else
        # Another kid as parent.  Grandparent must be male.
        bob1=find_unit(game,grandmother,event)
        if bob1[1][1,1]=="f" && !(@gay_canon.include?(bob1[0]) && bob1[1][2,1]!="A")
          bob2=find_unit(game,mother,event)
          g="they already have"
          g="he already has" if bob2[1][1,1]=="m"
          g="she already has" if bob2[1][1,1]=="f"
          event.respond("#{grandmother} cannot be #{mother}'s mother, as #{g} one.  Showing default #{mother}!Morgan")
          grandmother = nil
        end
      end
    elsif !mother.nil? && ['A'].include?(f[1][2])
      if ["Morgan","Portia"].include?(kidname)
      elsif ["Lucina"].include?(kidname)
        # Lucina as the child.  Parent must be female.
        bob1=find_unit(game,mother,event)
        if bob1[1][1,1]=="m" && !(@gay_canon.include?(bob1[0]) && bob1[1][2,1]!="A")
          bob2=find_unit(game,kidname,event)
          g="they already have"
          g="he already has" if bob2[1][1,1]=="m"
          g="she already has" if bob2[1][1,1]=="f"
          event.respond("#{mother} cannot be #{kidname}'s father, as #{g} one.  Showing default #{kidname}")
          mother = nil
        end
      else
        # Another kid as child.  Parent must be male.
        bob1=find_unit(game,mother,event)
        if bob1[1][1,1]=="f" && !(@gay_canon.include?(bob1[0]) && bob1[1][2,1]!="A")
          bob2=find_unit(game,kidname,event)
          g="they already have"
          g="he already has" if bob2[1][1,1]=="m"
          g="she already has" if bob2[1][1,1]=="f"
          event.respond("#{mother} cannot be #{kidname}'s mother, as #{g} one.  Showing default #{kidname}")
          mother = nil
        end
      end
    elsif !grandmother.nil? && ['F'].include?(f2[1][2])
      if grandmother == "Corrin" && kidname.downcase != "portia"
        # Corrin as grandparent
        event.respond("#{grandmother} cannot be both Kana's grandparent and parent.  Showing default #{mother}!#{kidname}")
        grandmother = nil
      elsif mother=="Portia"
      elsif @shigure_class_kids.include?(mother)
        # Shigure as the parent.  Grandparent must be male.
        bob1=find_unit(game,grandmother,event)
        if bob1[1][1,1]=="f" && !(@gay_canon.include?(bob1[0]) && bob1[1][2,1]!="F")
          bob2=find_unit(game,mother,event)
          g="they already have"
          g="he already has" if bob2[1][1,1]=="m"
          g="she already has" if bob2[1][1,1]=="f"
          event.respond("#{grandmother} cannot be #{mother}'s mother, as #{g} one.  Showing default #{mother}!Kana")
          grandmother = nil
        end
      else
        # Another kid as parent.  Grandparent must be female.
        bob1=find_unit(game,grandmother,event)
        if bob1[1][1,1]=="m" && !(@gay_canon.include?(bob1[0]) && bob1[1][2,1]!="F")
          bob2=find_unit(game,mother,event)
          g="they already have"
          g="he already has" if bob2[1][1,1]=="m"
          g="she already has" if bob2[1][1,1]=="f"
          event.respond("#{grandmother} cannot be #{mother}'s father, as #{g} one.  Showing default #{mother}!Kana")
          grandmother = nil
        end
      end
    elsif !mother.nil? && ['F'].include?(f[1][2])
      if ["Kana","Portia"].include?(kidname)
      elsif @shigure_class_kids.include?(kidname)
        # Shigure as the parent.  Parent must be male.
        bob1=find_unit(game,mother,event)
        if bob1[1][1,1]=="f" && !(@gay_canon.include?(bob1[0]) && bob1[1][2,1]!="F")
          bob2=find_unit(game,kidname,event)
          g="they already have"
          g="he already has" if bob2[1][1,1]=="m"
          g="she already has" if bob2[1][1,1]=="f"
          event.respond("#{mother} cannot be #{kidname}'s mother, as #{g} one.  Showing default #{kidname}")
          mother = nil
        end
      else
        # Another kid as parent.  Parent must be female.
        bob1=find_unit(game,mother,event)
        if bob1[1][1,1]=="m" && !(@gay_canon.include?(bob1[0]) && bob1[1][2,1]!="F")
          bob2=find_unit(game,kidname,event)
          g="they already have"
          g="he already has" if bob2[1][1,1]=="m"
          g="she already has" if bob2[1][1,1]=="f"
          event.respond("#{mother} cannot be #{kidname}'s father, as #{g} one.  Showing default #{kidname}")
          mother = nil
        end
      end
    end
  elsif kidname=="Kana" && grandmother=="Corrin"
    event.respond("#{grandmother} cannot be both Kana's granparent and parent.  Showing default #{mother}!#{kidname}")
    grandmother = nil
  elsif kidname=="Morgan" && grandmother=="Robin"
    event.respond("#{grandmother} cannot be both Morgan's granparent and parent.  Showing default #{mother}!#{kidname}")
    grandmother = nil
  end
  if !grandmother.nil?
    if mother=="Inigo" && ["Laslow"].include?(grandmother)
      event.respond "Inigo cannot sire himself; that's a grandfather paradox, and borderline parthenogenesis.  Showing default Inigo as the father." if permerror
      grandmother=nil
    elsif mother=="Owain" && ["Odin"].include?(grandmother)
      event.respond "Owain cannot sire himself; that's a grandfather paradox, and borderline parthenogenesis.  Showing default Owain as the father." if permerror
      grandmother=nil
    end
  elsif !mother.nil?
    if kidname=="Inigo" && ["Laslow"].include?(mother)
      event.respond "Inigo cannot sire himself; that's a grandfather paradox, and borderline parthenogenesis.  Showing default Inigo." if permerror
      mother=nil
    elsif kidname=="Owain" && ["Odin"].include?(mother)
      event.respond "Owain cannot sire himself; that's a grandfather paradox, and borderline parthenogenesis.  Showing default Owain." if permerror
      mother=nil
    end
  end
  if !incest_filter?(event)
    if !grandmother.nil?
      if mother=="Forrest" && ["Xander","Camilla","Elise"].include?(grandmother)
        event.respond "Leo cannot marry #{grandmother}; incest is not wincest.  Showing default Forrest as the father." if permerror
        grandmother=nil
      elsif mother=="Siegbert" && ["Leo","Camilla","Elise"].include?(grandmother)
        event.respond "Xander cannot marry #{grandmother}; incest is not wincest.  Showing default Siegbert as the father." if permerror
        grandmother=nil
      elsif mother=="Kiragi" && ["Ryoma","Sakura","Hinoka"].include?(grandmother)
        event.respond "Takumi cannot marry #{grandmother}; incest is not wincest.  Showing default Kiragi as the father." if permerror
        grandmother=nil
      elsif mother=="Shiro" && ["Takumi","Sakura","Hinoka"].include?(grandmother)
        event.respond "Ryoma cannot marry #{grandmother}; incest is not wincest.  Showing default Shiro as the father." if permerror
        grandmother=nil
      elsif mother=="Lucina" && ["Lissa","Emmeryn"].include?(grandmother)
        event.respond "Chrom cannot marry #{grandmother}; incest is not wincest.  Showing default Lucina as the mother." if permerror
        grandmother=nil
      elsif mother=="Ophelia" && ["Lissa"].include?(grandmother)
        event.respond "Odin cannot marry his mother; incest is not wincest.  Showing default Ophelia as the mother." if permerror
        grandmother=nil
      elsif mother=="Soleil" && ["Olivia"].include?(grandmother)
        event.respond "Laslow cannot marry his mother; incest is not wincest.  Showing default Soleil as the mother." if permerror
        grandmother=nil
      elsif mother=="Ocarina" && ["Gatenia","Xiao-va","Aoi"].include?(grandmother)
        event.respond "GSO cannot marry his sister; incest is not wincest.  Showing default Ocarina as the mother." if permerror
        grandmother=nil
      end
    elsif !mother.nil?
      if kidname=="Forrest" && ["Xander","Camilla","Elise"].include?(mother)
        event.respond "Leo cannot marry #{mother}; incest is not wincest.  Showing default Forrest." if permerror
        mother=nil
      elsif kidname=="Siegbert" && ["Leo","Camilla","Elise"].include?(mother)
        event.respond "Xander cannot marry #{mother}; incest is not wincest.  Showing default Siegbert." if permerror
        mother=nil
      elsif kidname=="Kiragi" && ["Ryoma","Sakura","Hinoka"].include?(mother)
        event.respond "Takumi cannot marry #{mother}; incest is not wincest.  Showing default Kiragi." if permerror
        mother=nil
      elsif kidname=="Shiro" && ["Takumi","Sakura","Hinoka"].include?(mother)
        event.respond "Ryoma cannot marry #{mother}; incest is not wincest.  Showing default Shiro." if permerror
        mother=nil
      elsif kidname=="Lucina" && ["Lissa","Emmeryn"].include?(mother)
        event.respond "Chrom cannot marry #{mother}; incest is not wincest.  Showing default Lucina." if permerror
        mother=nil
      elsif kidname=="Ophelia" && ["Lissa"].include?(mother)
        event.respond "Odin cannot marry his mother; incest is not wincest.  Showing default Ophelia." if permerror
        mother=nil
      elsif kidname=="Soleil" && ["Olivia"].include?(mother)
        event.respond "Laslow cannot marry his mother; incest is not wincest.  Showing default Soleil." if permerror
        mother=nil
      elsif kidname=="Ocarina" && ["Gatenia","Xiao-va","Aoi"].include?(mother)
        event.respond "GSO cannot marry his sister; incest is not wincest.  Showing default Ocarina." if permerror
        mother=nil
      end
    end
  end
  return [kidname,mother,grandmother]
end

def unit_creation(units,bob1=nil,bob2=nil,bob3=nil,bob4=nil,event)
  game=""
  game=game_proc(event)
  unitsx=[]
  for i in 0...units.length+1
    unless units[i].nil?
      unless bob1.nil?
        unitsx[i]=bob1 if units[i].downcase==bob1[0].downcase.gsub('**','')
      end
      unless bob2.nil?
        unitsx[i]=bob2 if units[i].downcase==bob2[0].downcase.gsub('**','')
      end
      unless bob3.nil?
        unitsx[i]=bob3 if units[i].downcase==bob3[0].downcase.gsub('**','')
      end
      unless bob4.nil?
        unitsx[i]=bob4 if units[i].downcase==bob4[0].downcase.gsub('**','')
      end
      if unitsx[i].nil?
        unitsx[i]=find_unit(game,units[i],event)
      end
      unless units[i+1].nil?
        unitsx[i]=find_unit("Awakening","Lucina",event) if units[i]=="Lucina" && game==""
      end
    end
  end
  return unitsx
end

def homosexuality_filter?(event)
  return false if event.server.nil?
  metadata_load()
  return @homo_servers.include?(event.server.id)
end

def incest_filter?(event)
  return false if event.server.nil?
  metadata_load()
  return @incest_servers.include?(event.server.id)
end

def find_unit(game,name,event,disp=true,f3=false)
  xgame=game_proc(event)
  name=normalize(name) unless name.nil?
  if !name.nil? && name.downcase.gsub(' ','').gsub('_','')[0,2]=="<:"
    name=name.split(':')[1] unless find_unit(game,name.split(':')[1],event,disp,f3).nil?
  end
  x=x_find_unit(game,name,event,disp,f3)
  while !x.nil? && x[1][0,1].to_i.to_s != x[1][0,1]
    data_load()
    x=x_find_unit(game,name,event,disp,f3)
  end
  unless x.nil?
    if game=='Awakening' && x[0]=='Lucina'
      x=@units[@units.find_index{|q| q[0]=='Lucina' && q[1][2,1]=='A'}]
    end
    unless x[1].nil?
      x[0]="Awakening!Anna" if x[0]=="Anna" && x[1][2]=="A"
      x[0]="Fates!Anna" if x[0]=="Anna" && x[1][2]=="F"
      x[0]="3H!Anna" if x[0]=="Anna" && x[1][2]=="T"
    end
  end
  return x
end

def mentions_avatar_kid(event,game)
  k=0
  k=event.server.id unless event.server.nil?
  nicknames_load()
  morgan_names=["Morgan"]
  kana_names=["Kana"]
  alz=@names.reject{|q| q[0]!='Unit'}.map{|q| [q[1],q[2],q[3]]}
  for i in 0...alz.length
    morgan_names.push(alz[i][0]) if alz[i][1]=="Morgan" && (alz[i][2].nil? || alz[i][2].include?(k))
    kana_names.push(alz[i][0]) if alz[i][1]=="Kana" && (alz[i][2].nil? || alz[i][2].include?(k))
  end
  if game=="Awakening"
    for i in 0...morgan_names.length
      return true if event.message.text.downcase.include?(morgan_names[i].downcase)
    end
  elsif game=="Fates"
    for i in 0...kana_names.length
      return true if event.message.text.downcase.include?(kana_names[i].downcase)
    end
  end
  return false
end

def x_find_unit(xgame,name,event,disp=true,f3=false)
  xgame=game_proc(event)
  return nil if name.nil?
  return nil if !name.is_a?(String)
  name=normalize(name)
  return nil if name.length<3 && name.downcase != "me" && name.downcase != "mc" && name.downcase != "mu"
  return find_unit("Awakening","Anna",event) if "awakening!anna"==name.downcase
  return find_unit("Fates","Anna",event) if "fates!anna"==name.downcase
  return find_unit("Three Houses","Anna",event) if "3h!anna"==name.downcase
  return "Lilith" if "lilith"==name.downcase
  xgame="Awakening" if xgame=="" && name.downcase != "lucina" && name.downcase != "anna"
  return find_unit("Fates","Selena",event) if "severa"==name.downcase && xgame.downcase=="fates"
  return find_unit("Fates","Odin",event) if "owain"==name.downcase && xgame.downcase=="fates"
  return find_unit("Fates","Laslow",event) if "inigo"==name.downcase && xgame.downcase=="fates"
  xgame="Fates" if xgame=="" && name.downcase != "lucina" && name.downcase != "anna" && name.downcase != "robin"
  xstats=find_stats_in_string(event)
  xxgame=""
  xxgame=game_proc(event)
  if name.downcase=="corrin" && (xxgame=="Fates" || (xxgame != "Awakening" && (xstats[0].length>0 && xstats[1].length>0) && !mentions_avatar_kid(event,"Awakening")))
    momstuff=get_corrin(event,false)
    g=momstuff[0]
    m=momstuff[1]
    c=momstuff[2]
    n=momstuff[3]
    d=momstuff[4]
    d2=momstuff[5]
    c=">talent<" if c.nil?
    c=">talent<" if c.length<2
    mom=["Corrin",'1cFrD',"Available in all routes",g,m,['Nohr Royal', c],['Nohr Royal', c]]
    return mom
  elsif name.downcase=="robin" && (xxgame=="Awakening" || (xxgame != "Fates" && (xstats[0].length>0 || xstats[1].length>0) && !mentions_avatar_kid(event,"Fates")))
    momstuff=get_robin(event,false)
    g=momstuff[0]
    m=momstuff[1]
    c=momstuff[2]
    n=momstuff[3]
    d=momstuff[4]
    d2=momstuff[5]
    c=">talent<" if c.nil?
    c=">talent<" if c.length<2
    mom=["Robin",'1cA',"*Awakening*",g,m,['Tactician', 'Everything'],['Tactician']]
    return mom
  end
  if name.length>5
    if name[name.length-5,5].downcase=="!kana"
      return create_kid(event, "kana", name[0,name.length-5], 1, false, f3)
    elsif name[name.length-6,6].downcase=="!kanna"
      return create_kid(event, "kana", name[0,name.length-6], 1, false, f3)
    elsif name[name.length-5,5].downcase=="!morgan"
      return create_kid(event, "morgan", name[0,name.length-5], 1, false, f3)
    elsif name[name.length-5,5].downcase=="!marc"
      return create_kid(event, "morgan", name[0,name.length-5], 1, false, f3)
    elsif name.include?("!")
      b=[]
      name.each_line("!") {|l| b.push(l)}
      for i in 0...b.length
        b[i]=b[i][0,b[i].length-1] if i<b.length-1
      end
      b=["#{b[0]}!#{b[1]}",b[2]] if ["fates","awakening"].include?(b[0].downcase)
      return create_kid(event, b[1], b[0], 1, false, f3)
    end
  end
  # first tries full names of in-game characters
  bob4=[]
  data_load()
  u=@units.map{|q| q}
  for i in 0...u.length
    u[i][0]="n" if u[i][0]=="Lucina" && u[i][2]=="Amiibo Character" && xgame=="Awakening"
    u[i][0]="n" if u[i][0]=="Anna" && u[i][1][2]!=xgame[0] && !(xgame=='' && u[i][1][2]=='T')
    return u[i] if u[i][0].downcase==name.downcase && name.downcase != "kana" && name.downcase != "morgan" && ((!event.server.nil? && event.server.id==256291408598663168) || u[i][1][3,1]!="g")
    return u[i] if u[i][0].downcase==name.downcase && name.downcase=='Mathoo' && @shardizard==4
    bob4=u[i] if u[i][0].gsub(' ','').downcase==name.gsub(' ','').downcase || (u[i][1][2]=='T' && u[i][0].split(' ')[0].downcase==name.downcase)
  end
  if name.downcase=="kana"
    momstuff=get_corrin(event,false)
    m=momstuff[1]
    c=momstuff[2]
    c=">talent<" if c.nil?
    c=">talent<" if c.length<2
    bob4[5]=['Nohr Royal',c]
    bob4[6]=['Nohr Royal',c]
    for i in 1...7
      bob4[4][i]=m[i]+1
    end
    bob4[1]="3cFrD"
    return bob4
  elsif name.downcase=="morgan"
    momstuff=get_robin(event,false)
    m=momstuff[1]
    for i in 1...7
      bob4[4][i]=m[i]+1
    end
    bob4[1]="3cA"
    bob4[5]=['*same as variable parent*',"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Healer","Archer","Thief","Wyvern Rider","Mage","Dark Mage"]
    bob4[6]=['*same as variable parent*',"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Healer","Archer","Thief","Wyvern Rider","Mage","Dark Mage"]
    return bob4
  end
  # then the Japanese counterpart names
  k=0
  k=event.server.id unless event.server.nil?
  nicknames_load()
  alz=@names.reject{|q| q[0]!='Unit'}.map{|q| [q[1],q[2],q[3]]}
  for i in 0...alz.length
    return find_unit(xgame,alz[i][1],event,false) if alz[i][0].downcase==name.downcase && (alz[i][2].nil? || alz[i][2].include?(k))
    return find_unit(xgame,alz[i][1],event,false) if alz[i][0].gsub('||','').downcase==name.downcase && (alz[i][2].nil? || alz[i][2].include?(k))
  end
  # Retries all of the above, but this time looking for slight matches.
  return "Lilith" if "lilith"[0,name.length]==name.downcase
  return find_unit("Fates","Selena",event) if "severa"[0,name.length]==name.downcase && xgame=="Fates"
  return find_unit("Fates","Odin",event) if "owain"[0,name.length]==name.downcase && xgame=="Fates"
  return find_unit("Fates","Laslow",event) if "inigo"[0,name.length]==name.downcase && xgame=="Fates"
  for i in 0...u.length
    u[i][0]="n" if u[i][0]=="Lucina" && u[i][2]=="Amiibo Character" && xgame=="Awakening"
    u[i][0]="n" if u[i][0]=="Anna" && u[i][1][2]!=xgame[0] && !(xgame=='' && u[i][1][2]=='T')
    return u[i] if u[i][0][0,name.length].downcase==name.downcase && name.downcase != "kana"[0,name.length] && name.downcase != "morgan"[0,name.length] && ((!event.server.nil? && event.server.id==256291408598663168) || u[i][1][3,1]!="g")
    return u[i] if u[i][0][0,name.length].downcase==name.downcase && name.downcase=='Mathoo'[0,name.length] && @shardizard==4
    bob4=u[i] if u[i][0].gsub(' ','')[0,name.length].downcase==name.gsub(' ','').downcase
  end
  if name.downcase=="kana"[0,name.length]
    momstuff=get_corrin(event,false)
    m=momstuff[1]
    c=momstuff[2]
    c=">talent<" if c.nil?
    c=">talent<" if c.length<2
    bob4[5].push(c)
    bob4[6].push(c)
    for i in 1...7
      bob4[4][i]=m[i]+1
    end
    bob4[1]="3cF"
    return bob4
  elsif name.downcase=="morgan"[0,name.length]
    momstuff=get_robin(event,false)
    m=momstuff[1]
    for i in 1...7
      bob4[4][i]=m[i]+1
    end
    bob4[1]="3cA"
    bob4[5]=['>same as variable parent<',"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Healer","Archer","Thief","Wyvern Rider","Mage","Dark Mage"]
    bob4[6]=['>same as variable parent<',"Tactician","Cavalier","Knight","Myrmidon","Mercenary","Healer","Archer","Thief","Wyvern Rider","Mage","Dark Mage"]
    return bob4
  end
  # then the Japanese counterpart names
  for i in 0...alz.length
    return find_unit(xgame,alz[i][1],event,false) if alz[i][0][0,name.length].downcase==name.downcase && (alz[i][2].nil? || alz[i][2].include?(k))
    return find_unit(xgame,alz[i][1],event,false) if alz[i][0][0,name.length].downcase.gsub('||','')==name.downcase && (alz[i][2].nil? || alz[i][2].include?(k))
  end
  return nil
end

def unit_parse(event,bot,args)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  event.message.delete if event.user.id==bot.profile.id
  game=game_proc(event)
  apt=0
  name1=nil
  name2=nil
  name3=nil
  name4=nil
  for i in 0...args.length
    if args[i].downcase=="aptitude"[0,args[i].length]
      apt=10
      apt=20 if game=="Awakening"
      apt=20 if game=="Three Houses"
      args[i]=nil
    end
  end
  args.compact!
  for i in 0...args.length
    unless find_unit(game,args[i],event).nil?
      if name1.nil?
        name1=args[i]
      elsif name2.nil?
        name2=args[i]
      elsif name3.nil?
        name3=args[i]
      elsif name4.nil?
        name4=args[i]
      end
    end
  end
  ### turning partial and/or weirdly-cased names into actual names ###
  bob1=find_unit(game,name1,event,false,true)
  bob2=find_unit(game,name2,event)
  bob3=find_unit(game,name3,event)
  bob4=find_unit(game,name4,event)
  if bob1=="Lilith"
    create_embed(event,"__**Lilith**__","*Fates*: Protector of My Castle\n**HP:** *Max:* 60\n**Strength:** *Max:* 28\n**Magic:** *Max:* 35\n**Skill:** *Max:* 29\n**Speed:** *Max:* 33\n**Luck:** *Max:* 35\n**Defense:** *Max:* 30\n**Resistance:** *Max:* 35\n**Default Class:** Astral Dragon\n**Cannot use Seals**",embed_color("*Fates*: Available in all routes"),nil,'https://vignette2.wikia.nocookie.net/fireemblem/images/f/ff/4Koma_Lilith.png/revision/latest?cb=20160817053542')
    return nil
  end
  if bob2=="Lilith"
    bob2=bob3
    bob3=bob4
    bob4=nil
    if bob2=="Lilith"
      bob2=bob3
      bob3=nil
      bob2=nil if bob2=="Lilith"
    end
  end
  if bob3=="Lilith"
    bob3=bob4
    bob4=nil
    bob3=nil if bob3=="Lilith"
  end
  if bob4=="Lilith"
    bob4=nil
  end
  step1=generation_parse(event,bob1,bob2,bob3,bob4)
  return nil if step1.nil? || step1[0].nil?
  kidname=step1[0]
  mother=step1[1]
  grandmother=step1[2]
  step2=unit_creation(step1,bob1,bob2,bob3,bob4,event)
  ### generating unit ###
  @bob=[]
  if kidname.downcase=="corrin" && game != "Awakening"
    get_corrin(event,true,apt)
  elsif kidname.downcase=="robin" && game != "Fates"
    get_robin(event,true,apt)
  else
    if !grandmother.nil?
      # three generations
      parent=create_kid(event,mother,step2[2],1,false)
      @bob=create_kid(event,kidname,parent,0)
      picture=get_picture(kidname,mother,grandmother,@bob[1][1,1],event)
    elsif !mother.nil?
      # two generations
      @bob=create_kid(event,kidname,step2[1])
      picture=get_picture(kidname,mother,nil,@bob[1][1,1],event)
    else
      # one generation
      @bob=step2[0]
      if kidname=="Portia"
        @bob[5].push('Dark Mage')
        @bob[6][2]='Dark Mage'
      end
      data_load()
      unless @bob[1][2]=='T'
        for i in 0...@bob[5].length
          clss=@bob[5][i]
          clss=gender_adjust(clss,@bob[1][1,1])
          if clss[0,10]=='Troubadour'
            if @bob[1][2,1]=='A'
              @bob[5][i]='Troubadour (War Cleric, Valkyrie)'
            elsif @bob[1][1,1]=='m'
              @bob[5][i]='Troubadour (Butler, Strategist)'
            elsif @bob[1][1,1]=='f'
              @bob[5][i]='Troubadour (Maid, Strategist)'
            else
              @bob[5][i]='Troubadour (Servant, Strategist)'
            end
          else
            @bob[5][i]=clss
            m=@classes.find_index{|q| q[0]==clss && q[1][0,1]==@bob[1][2,1]}
            @bob[5][i]="#{clss} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0
          end
        end
      end
      @bob[0]="Anna" if ["awakening!anna","fates!anna","3h!anna","anna"].include?(kidname.downcase)
      if @bob[0]=='Ferdinand von Aegir'
        @bob[0]="**#{@bob[0]}**"
      elsif @bob[1][2,1]=='T' && @bob[0].split(' ').length>1
        @bob[0]=@bob[0].split(' ')
        @bob[0]="**#{@bob[0][0]}** [#{@bob[0][1,@bob[0].length-1].join(' ')}]"
      else
        @bob[0]="**#{@bob[0]}**"
      end
      picture=get_picture(kidname,nil,nil,@bob[1][1,1],event)
    end
    fullname="__#{@bob[0]}#{" (with *Aptitude*)" if apt>0}__"
    path=@bob[2]
    text=''
    unless path.nil?
      path="*Fates*: #{path}" if !path.include?("Awakening") && !path.include?("Cross-game")
      path=path.gsub('Fates','Three Houses') if @bob[1][2]=='T'
      text=path
    end
    if apt>0 && game==""
      f=find_unit(game,kidname,event)
      apt=10
      apt=20 if ["Awakening","*Awakening*"].include?(f[1])
      apt=20 if ["Three Houses","*Three Houses*"].include?(f[1])
    end
    unless picture.nil?
      picture=nil if picture[0,1]=='>'
    end
    text="#{text}\n**Personal #{'Skill' unless @bob[1][2]=='T'}#{'Ability' if @bob[1][2]=='T'}:** *#{@bob[7]}*  #{@skills[@skills.find_index{|q| q[0]==@bob[7] && (q[1][0]==@bob[1][2,1] || q[1]=='Fateswakening')}][4]}" unless @bob[7].nil? || game=="Awakening" || @bob[1][2,1]=="A" || @skills.find_index{|q| q[0]==@bob[7] && (q[1][0]==@bob[1][2,1] || q[1]=='Fateswakening')}.nil?
    unless @bob[9].nil? || @bob[9].length<=0
      cre=[]
      mys=false
      for i in 0...@bob[9].length
        if @bob[9][i].downcase=='mystery'
          mys=true
        else
          scre=''
          hide=false
          pos=0
          if @bob[9][i][0,2]=='||'
            scre=@bob[9][i].gsub('||','')
            hide=true
          elsif @bob[9][i].include?(' (minor)')
            scre=@bob[9][i].gsub(' (minor)','')
            pos=1
          else
            scre=@bob[9][i]
          end
          scre=@crests[@crests.find_index{|q| q[0]==scre}]
          cre.push("#{'*Mystery Crest:*  ' if mys}#{'||' if hide || mys}*#{['','Minor '][pos]}Crest of #{scre[0]}* #{scre[1]} (Proc rate: #{scre[2][pos]}%)#{'||' if hide || mys}")
          mys=false
        end
      end
      if cre.length<=0
      elsif cre.length==1
        text="#{text}\n**Crest:** #{cre[0]}"
      else
        text="#{text}\n**Crest:**\n#{cre.join("\n")}"
      end
    end
    if @bob[8].nil? || @bob[8].length<=1
    elsif @bob[8].length==2
      text="#{text}\n**Birthday:** #{@bob[8][1]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][@bob[8][0]]}"
    else
      text="#{text}\n**Birthday:** #{@bob[8][2]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][@bob[8][1]]} #{@bob[8][0]}"
    end
    prf=@items.find_index{|q| !q[1].nil? && !q[3].nil? && q[3].gsub('*','')==@bob[0].gsub('**','') && @bob[1][2,1]==q[1][0].gsub('G','F')}
    text="#{text}\n**Prf weapon:** *#{@items[prf][0]}*" unless prf.nil? || ['staff','rod'].include?(@items[prf][2][0].downcase)
    text="#{text}\n**Prf staff:** *#{@items[prf][0]}*" unless prf.nil? || !['staff','rod'].include?(@items[prf][2][0].downcase)
    text="#{text}\n**Pseudo-Prf staff:** *Liliputia*" if @bob[0].gsub('**','')=='Mathoo'
    text="#{text}\n**Can use Dragon Veins**" if @bob[1].length>4 && @bob[1][4]=='d' && @bob[1][2]=='F'
    text="#{text}\n**Can use Dragon Veins**, weak to dragon-effective weapons regardless of class" if @bob[1].length>4 && @bob[1][4]=='D' && @bob[1][2]=='F'
    flds=nil
    m=['HP','Strength','Magic','Skill','Speed','Luck','Defense','Resistance']
    m=['HP','Strength','Magic','Dexterity','Speed','Luck','Defense','Resistance','Charm'] if @bob[1][2]=='T'
    flds=[["**Growth Rates**",[]],["**Modifiers**",['-']],["**Classes**","*Default class:* #{@bob[5][0]}\n*#{'Seals unusable' if @bob[0]=='**Candace**'}#{'Heart Seal' if @bob[0]!='**Candace**' && @bob[1][2]=='F'}#{'Second Seal' if @bob[0]!='**Candace**' && @bob[1][2]=='A'}#{':'if @bob[0]!='**Candace**'}* #{'~~none~~' if @bob[5].length<=1 && @bob[0]!='**Candace**'}#{@bob[5][1,@bob[5].length-1].join(', ')}#{"\n*Partner Seal:* Spear Master, Basara" if @bob[0].gsub('**','')=='Mathoo'}",false]]
    if @bob[1][2]=='T'
      flds=[["**Growth Rates**",[]],["**Base Stats**",[]],["**Maximum Stats**",[]],["**Classes and Skills**","*Default class:* #{@bob[6][0]}",false]]
      flds[3][1]="#{flds[3][1]}\n*Strengths:* #{@bob[10].join(', ')}" unless @bob[10].nil? || @bob[10].length<=0
      flds[3][1]="#{flds[3][1]}\n*Weaknesses:* #{@bob[11].join(', ')}" unless @bob[11].nil? || @bob[11].length<=0
      flds[3][1]="#{flds[3][1]}\n*Budding Talent:* #{@bob[12]}" unless @bob[12].nil? || @bob[12].length<=0
    end
    f=[0,0,0]
    for i in 0...m.length
      flds[0][1].push("*#{m[i]}:*  #{@bob[3][i]+apt}%")
      if @bob[1][2]=='T'
        flds[1][1].push("*#{m[i]}:*  #{@bob[4][i]}")
        flds[2][1].push("*#{m[i]}:*  #{@bob[5][i]}")
        f[2]+=@bob[5][i]
      else
        flds[1][1].push("*#{m[i]}:*  #{'+' if @bob[4][i]>0}#{@bob[4][i]}") unless i==0
      end
      f[0]+=@bob[3][i]+apt
      f[1]+=@bob[4][i]
    end
    flds[0][1].push('')
    flds[1][1].push('')
    flds[2][1].push('') if @bob[1][2]=='T'
    flds[0][1].push("*Total:*  #{f[0]}%")
    flds[1][1].push("*Total:*  #{'+' if f[1]>0 && @bob[1][2]!='T'}#{f[1]}")
    flds[2][1].push("*Total:*  #{f[2]}") if @bob[1][2]=='T'
    flds[0][1]=flds[0][1].join("\n")
    flds[1][1]=flds[1][1].join("\n")
    flds[2][1]=flds[2][1].join("\n") if @bob[1][2]=='T'
    xstats=find_stats_in_string(event)
    game=game_proc(event)
    if step1[0].downcase=="robin" || (!step1[1].nil? && step1[1].downcase=="robin") || (!step1[2].nil? && step1[2].downcase=="robin")
      if (game=="Awakening" || (game != "Fates" && (xstats[0].length>0 || xstats[1].length>0) && !mentions_avatar_kid(event,"Fates")))
        foot="Robin: +#{xstats[0]}, -#{xstats[1]}"
      else
        foot="Robin: Amiibo"
      end
    elsif step1[0].downcase=="morgan"
      foot="Robin: +#{xstats[0]}, -#{xstats[1]}"
    end
    foot2=nil
    if step1[0].downcase=="corrin" || (!step1[1].nil? && step1[1].downcase=="corrin") || (!step1[2].nil? && step1[2].downcase=="corrin")
      if (game=="Fates" || (game != "Awakening" && (xstats[0].length>0 || xstats[1].length>0) && !mentions_avatar_kid(event,"Awakening")))
        foot2="Corrin: +#{xstats[0]}, -#{xstats[1]}"
      else
        foot2="Corrin: Default"
      end
    elsif step1[0].downcase=="kana"
      foot2="Corrin: +#{xstats[0]}, -#{xstats[1]}"
    end
    if foot.nil?
      foot=foot2
    else
      foot="#{foot} / #{foot2}" unless foot2.nil?
    end
    fgame='Fates'
    fgame='Awakening' if @bob[1][2]=='A'
    fgame='Three Houses' if @bob[1][2]=='T'
    create_embed(event,fullname,text,embed_color(path,fgame),foot,picture,flds,2)
  end
  return nil
end

def class_display(event,bot,args,clss,game=nil)
  game=game_proc(event) if game.nil?
  apt=0
  for i in 0...args.length
    if args[i].downcase=="aptitude"[0,args[i].length] && args[i].length>2
      apt=10
      apt=20 if game=="Awakening"
      apt=20 if game=="Three Houses"
    end
  end
  apt=20 if clss[1]=="Three Houses" && apt>0
  apt=20 if clss[1]=="Awakening" && apt>0
  apt=10 if clss[1]=="Fates" && apt>0
  b=["HP","Strength","Magic","Skill","Speed","Luck","Defense","Resistance"]
  b=["HP","Strength","Magic","Dexterity","Speed","Luck","Defense","Resistance","Charm"] if clss[1]=='Three Houses'
  flds=nil
  clzz=@classes.map{|q| q}
  clss[0]=clss[0].gsub(' (C)','')
  fullname="__**#{clss[0].gsub(' (C)','')}**#{" (with *Aptitude*)" if apt>0}__"
  clss[0]=clss[0].gsub(' (C)','')
  for i in 0...clss[8].length
    gmz=['Fateswakening',clss[1]]
    gmz[1]='Gates' if clss[2]=='Penumbra'
    gmz[0]='Three Houses' if clss[1]=='Three Houses'
    s=@skills[@skills.find_index{|q| q[0]==clss[8][i] && gmz.include?(q[1])}]
    f=s[2].find_index{|q| q[0]==clss[0]}
    f=s[2].find_index{|q| q[0].split('(')[0].gsub(' ','')==clss[0].split('(')[0].gsub(' ','')} if f.nil?
    f=0 if f.nil?
    clss[8][i]="*#{clss[8][i]} [level #{s[2][f][1]}]*  #{s[4]}" unless f.nil?
  end
  prm=[]
  prm=clzz.reject{|q| q[1]!=clss[1] || q[7].nil? || !q[7].include?(clss[0])}.map{|q| "*#{q[0]}*#{"  (#{q[8].join(', ')})" unless q[8].nil? || q[8].length<=0}"} unless clss[1]=='Three Houses'
  skz=[]
  skz=@skills.reject{|q| q[1]!='Three Houses' || q[2]=='-' || !q[2].map{|q2| q2.join(', ')}.include?("#{clss[0]}, class")}
  text=''
  text="#{fullname}" if @embedless.include?(event.user.id) || was_embedless_mentioned?(event)
  if @embedless.include?(event.user.id) || was_embedless_mentioned?(event)
    f=[0,0,0]
    for i in 0...b.length
      text="#{text}\n**#{b[i]}:**  *Growth:* #{clss[3][i].to_i+apt}%  *Base:* #{clss[5][i]}  *#{'Maximum' unless clss[1]=='Three Houses'}#{'Modifier' if clss[1]=='Three Houses'}:* #{'+' if clss[4][i].to_i>0 && clss[1]=='Three Houses'}#{clss[4][i]}"
      f[0]+=clss[3][i].to_i+apt
      f[1]+=clss[5][i].to_i
      f[2]+=clss[4][i].to_i
    end
    text="#{text}\n**Total:**  *Growth:* #{f[0]}%  *Base:* #{f[1]}  *#{'Maximum' unless clss[1]=='Three Houses'}#{'Modifier' if clss[1]=='Three Houses'}:* #{'+' if f[2]>0 && clss[1]=='Three Houses'}#{f[2]}"
  end
  if clss[6].nil? || clss[6]==''
    text="#{text}\n**#{clss[7][0].split(' ')[-1]} Class**#{", Adjutant #{clss[11]}" unless clss[11].nil?}" if clss[1]=='Three Houses' && clss[7].length>0 && clss[7][0].length>0
  elsif clss[6].include?('**')
    text="#{text}\n#{clss[6].gsub('/n',"\n").gsub('/t',"  ")}"
  else
    text="#{text}\n**#{clss[6]} Class**"
  end
  if clss[1]=='Three Houses'
    text="#{text}\n**Certification requirements:** #{clss[10]}#{', Dark Seal' if clss[7].length>0 && clss[7][0].include?('Dark')}" if clss[10].length>0
    text="#{text}\n**Class Abilit#{"ies:**\n" if skz.length>1}#{'y:** ' unless skz.length>1}#{skz.map{|q| "*#{q[0]}* #{q[4]}"}.join("\n")}" unless skz.length<=0 || clss[6].include?("Class Abilit#{"ies" if skz.length>1}#{'y' unless skz.length>1}")
    text="#{text}\n**Mastery Abilit#{"ies:**\n" if clss[8].length>1}#{'y:** ' unless clss[8].length>1}#{clss[8].map{|q| q.gsub(' [level mastery]','')}.join("\n")}" unless clss[8].nil? || clss[8].length<=0 || clss[6].include?("Mastery Abilit#{"ies" if clss[8].length>1}#{'y' unless clss[8].length>1}")
    text="#{text}\n**Skill Bonuses:** #{clss[9].map{|q| "#{q[0]} (+#{q[1]})"}.join(', ')}" unless clss[9].nil? || clss[9].length<=0 || clss[6].include?('Skill Bonuses')
  else
    text="#{text}\n**Promotes from:** Discord bot" if clss[0]=="Automaton"
    text="#{text}\n**Promotes from:**\n#{prm.join("\n")}" if prm.length>0 && clss[0]!="Automaton" && !clss[6].include?('Promotes from')
    text="#{text}\n**Promotes into:**\n#{clss[7].map{|q| clzz[clzz.find_index{|q2| q2[0]==q && q2[1]==clss[1]}]}.map{|q| "*#{q[0]}*#{"  (#{q[8].join(', ')})" unless q[8].nil? || q[8].length<=0}"}.join("\n")}" unless clss[7].nil? || clss[7].length<=0 || clss[6].include?('Promotes into')
    text="#{text}\n**Skills learned:**\n#{clss[8].join("\n")}" unless clss[8].nil? || clss[8].length<=0 || clss[6].include?('Skills learned')
    text="#{text}\n**Useable Weapons:** #{clss[9].map{|q| "#{q[0]} (#{q[1]})"}.join(', ')}" unless clss[9].nil? || clss[9].length<=0 || clss[6].include?('Useable Weapons')
  end
  event.respond text if @embedless.include?(event.user.id) || was_embedless_mentioned?(event)
  return nil if @embedless.include?(event.user.id) || was_embedless_mentioned?(event)
  flds=[["**Growths**",""],["**Bases**",""],["**Maximums**",""]]
  flds=[["**Growths**",""],["**Bases**",""],["**Modifiers**",""]] if clss[1]=='Three Houses'
  f=[0,0,0]
  for i in 0...b.length
    flds[0][1]="#{flds[0][1]}\n*#{b[i]}:*  #{clss[3][i].to_i+apt}%"
    flds[1][1]="#{flds[1][1]}\n*#{b[i]}:*  #{clss[5][i].to_i}"
    flds[2][1]="#{flds[2][1]}\n*#{b[i]}:*  #{'+' if clss[4][i].to_i>0 && clss[1]=='Three Houses'}#{clss[4][i].to_i}"
    f[0]+=clss[3][i].to_i+apt
    f[1]+=clss[5][i].to_i
    f[2]+=clss[4][i].to_i
  end
  flds[0][1]="#{flds[0][1]}\n\n*Total:*  #{f[0]}%"
  flds[1][1]="#{flds[1][1]}\n\n*Total:*  #{f[1]}"
  flds[2][1]="#{flds[2][1]}\n\n*Total:*  #{'+' if f[2]>0 && clss[1]=='Three Houses'}#{f[2]}"
  xcolor=0x061069 if clss[1]=="Awakening"
  if clss[1]=="Fates"
    xcolor=0xC5EEF2
    xcolor=0xCF000D if clss[2]=="Hoshido"
    xcolor=0xAA7FCD if clss[2]=="Nohr"
    xcolor=0x2DA5AF if clss[2]=="Valla"
    xcolor=0xFFEA8B if clss[2]=="Penumbra"
  elsif clss[1]=="Three Houses"
    xcolor=0x2D6864
    xcolor=0x7D171F if clss[2]=="Adrestia"
    xcolor=0x4B4E9B if clss[2]=="Faerghus"
    xcolor=0x897A04 if clss[2]=="Leicester"
    xcolor=0x8A8D94 if clss[2]=="Underground"
    xcolor=0x003D3D if clss[2]=="Agartha"
  end
  create_embed(event,fullname,text,xcolor,nil,nil,flds)
end

def class_parse(event,bot,args)
  event.message.delete if event.user.id==bot.profile.id
  game=game_proc(event)
  s=event.message.text.downcase
  s=s[3,s.length-3] if ['fe!','3h!','fe?','3h?'].include?(s[0,3])
  s=s[4,s.length-4] if ['fea!','fef!','fea?','fef?'].include?(s[0,4])
  s=s[5,s.length-5] if ['fe13!','fe14!','fe16!','fe13?','fe14?','fe16?'].include?(s[0,5])
  args=s.split(' ')
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  if args.nil?
    event.respond("Please include a class name.")
    return nil
  elsif args.length.zero?
    event.respond("Please include a class name.")
    return nil
  end
  apt=0
  for i in 0...args.length
    args[i]=nil if args[i].downcase=="aptitude"[0,args[i].length]
  end
  args.compact!
  clss=find_class(args.join(' ').downcase,event)
  if clss.nil?
    for i in 0...args.length
      for i2 in 0...args.length-i
        clss=find_class(args[i,args.length-i-i2].join(' ').downcase,event) if clss.nil?
      end
    end
  end
  if clss.nil?
    event.respond("That is not the name of a class")
    return nil
  end
  clssA=find_class(clss[0].downcase,event,"Awakening")
  clssA=[] if clssA[1] != "Awakening"
  clssF=find_class(clss[0].downcase,event,"Fates")
  clssF=[] if clssF[1] != "Fates"
  clssT=find_class(clss[0].downcase,event,"Three Houses")
  clssT=[] if clssT[1] != "Three Houses"
  clsslst=[clssA.map{|q| q}, clssF.map{|q| q}, clssT.map{|q| q}].reject{|q| q.length<=0}
  clsslst=clsslst.reject{|q| q[0]!=clsslst[-1][0]}
  if game=="" && clsslst.length>1 && !safe_to_spam?(event)
    for i in 0...clsslst.length
      clsslst[i][1]='FEA!' if clsslst[i][1]=='Awakening'
      clsslst[i][1]='FEF!' if clsslst[i][1]=='Fates'
      clsslst[i][1]='FE3H!' if clsslst[i][1]=='Three Houses'
    end
    event.respond "I will not show every variation of this class.  Please either try one of the following commands or use this command in PM.\n#{clsslst.map{|q| "`#{q[1]}class #{q[0]}`"}.join("\n")}"
  elsif game=="" && clsslst.length>1
    for i in 0...clsslst.length
      class_display(event,bot,args,clsslst[i],clsslst[i][1])
    end
  else
    class_display(event,bot,args,clss,game)
  end
  return nil
end

def x_find_skill(game,name,event,fullname=false,everything=false)
  if !name.nil? && name.downcase.gsub(' ','').gsub('_','')[0,2]=="<:"
    name=name.split(':')[1] unless x_find_skill(game,name.split(':')[1],event,fullname).nil?
  end
  name=normalize(name) unless name.nil?
  # try skill from the specific game
  data_load()
  m=[game,'Fateswakening']
  m=['Three Houses','Fates','Awakening','Fateswakening'] if game.nil? || game.length<=0
  m.push('Gates') if !event.server.nil? && event.server.id==256291408598663168 && (game=='Fates' || game.nil? || game.length<=0)
  m=[game] if game=='Three Houses'
  sklz=@skills.map{|q| q}
  sklz=sklz.reject{|q| !m.include?(q[1])}
  sklz=sklz.reject{|q| @units.map{|q2| q2[0]}.include?(q[0]) || @skills.map{|q2| q2[0]}.include?(q[0])} if everything
  for i in 0...sklz.length
    return sklz[i] if sklz[i][0].gsub(' ','').downcase==name.gsub(' ','').downcase && m.include?(sklz[i][1])
  end
  nicknames_load()
  g=0
  g=event.server.id unless event.server.nil?
  return nil if name.length<3
  alz=@names.reject{|q| q[0]!='Skill'}.map{|q| [q[1],q[2],q[3]]}
  for i in alz
    if i[0].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
      x=sklz.find_index{|q| q[0]==i[1]}
      return sklz[x] unless x.nil?
    elsif i[0].gsub('||','').gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
      x=sklz.find_index{|q| q[0]==i[1]}
      return sklz[x] unless x.nil?
    end
  end
  unless fullname
    for i in 0...sklz.length
      return sklz[i] if sklz[i][0].gsub(' ','')[0,name.gsub(' ','').length].downcase==name.gsub(' ','').downcase && m.include?(sklz[i][1])
    end
    for i in alz
      if i[0][0,name.gsub(' ','').length].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
        x=sklz.find_index{|q| q[0]==i[1]}
        return sklz[x] unless x.nil?
      elsif i[0][0,name.gsub(' ','').length].gsub('||','').gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
        x=sklz.find_index{|q| q[0]==i[1]}
        return sklz[x] unless x.nil?
      end
    end
  end
  return nil if name=='acrobat'[0,name.length] && game=='Three Houses'
  # then try generic skill
  m=['Three Houses','Fates','Awakening','Fateswakening']
  m.push('Gates') if !event.server.nil? && event.server.id==256291408598663168
  sklz=@skills.map{|q| q}
  sklz=sklz.reject{|q| !m.include?(q[1])}
  sklz=sklz.reject{|q| @units.map{|q2| q2[0]}.include?(q[0]) || @skills.map{|q2| q2[0]}.include?(q[0])} if everything
  for i in 0...sklz.length
    return sklz[i] if sklz[i][0].gsub(' ','').downcase==name.gsub(' ','').downcase && m.include?(sklz[i][1])
  end
  for i in alz
    return x_find_skill(game,i[1],event) if i[0].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
    return x_find_skill(game,i[1],event) if i[0].gsub('||','').gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
  end
  unless fullname
    for i in 0...sklz.length
      return sklz[i] if sklz[i][0].gsub(' ','')[0,name.gsub(' ','').length].downcase==name.gsub(' ','').downcase && m.include?(sklz[i][1])
    end
    for i in alz
      return x_find_skill(game,i[1],event) if i[0].gsub(' ','').downcase==name.gsub(' ','')[0,name.gsub(' ','').length].downcase && (i[3].nil? || i[3].include?(g))
      return x_find_skill(game,i[1],event) if i[0].gsub('||','').gsub(' ','').downcase==name.gsub(' ','')[0,name.gsub(' ','').length].downcase && (i[3].nil? || i[3].include?(g))
    end
  end
  return nil
end

def find_skill(game,name,event,fullname=false,everything=false)
  return x_find_skill(game,name,event,fullname,everything) unless x_find_skill(game,name,event,fullname,everything).nil?
  if x_find_skill(game,name,event,fullname,everything).nil?
    args=name.split(' ')
    for i in 0...args.length
      return x_find_skill(game,args[0,args.length-i].join(' '),event,fullname,everything) unless x_find_skill(game,args[0,args.length-i].join(' '),event,fullname,everything).nil?
    end
    for i in 0...args.length
      return x_find_skill(game,args[i,args.length-i].join(' '),event,fullname,everything) unless x_find_skill(game,args[i,args.length-i].join(' '),event,fullname,everything).nil?
      for j in 0...args.length-i
        return x_find_skill(game,args[i,args.length-i-j].join(' '),event,fullname,everything) unless x_find_skill(game,args[i,args.length-i-j].join(' '),event,fullname,everything).nil?
      end
    end
  end
  return nil
end

def x_find_item(game,name,event,fullname=false,everything=false)
  if !name.nil? && name.downcase.gsub(' ','').gsub('_','')[0,2]=="<:"
    name=name.split(':')[1] unless x_find_item(game,name.split(':')[1],event,fullname).nil?
  end
  name=normalize(name) unless name.nil?
  # try item from the specific game
  data_load()
  return ["kvsnokfdn"] if name.length<3
  m=[game]
  m.push('Gates') if !event.server.nil? && event.server.id==256291408598663168 && game=='Fates'
  m=[game] if game=='Three Houses'
  itz=@items.map{|q| q}
  itz=itz.reject{|q| @units.map{|q2| q2[0]}.include?(q[0]) || @skills.map{|q2| q2[0]}.include?(q[0])} if everything
  for i in 0...itz.length
    return itz[i] if itz[i][0].gsub(' ','').downcase==name.gsub(' ','').downcase && m.include?(itz[i][1])
  end
  nicknames_load()
  g=0
  g=event.server.id unless event.server.nil?
  alz=@names.reject{|q| q[0]!='Item'}.map{|q| [q[1],q[2],q[3]]}
  for i in alz
    if i[0].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
      x=x_find_item(game,i[1],event)
      return x if m.include?(x[1])
    elsif i[0].gsub('||','').gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
      x=x_find_item(game,i[1],event)
      return x if m.include?(x[1])
    end
  end
  unless fullname
    for i in 0...itz.length
      return itz[i] if itz[i][0][0,name.length].gsub(' ','').downcase==name.gsub(' ','').downcase && m.include?(itz[i][1])
    end
    for i in alz
      if i[0][0,name.length].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
        x=x_find_item(game,i[1],event)
        return x if m.include?(x[1])
      elsif i[0][0,name.length].gsub('||','').gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
        x=x_find_item(game,i[1],event)
        return x if m.include?(x[1])
      end
    end
  end
  # then try generic item
  m=['Fates','Awakening','Three Houses']
  m.push('Gates') if !event.server.nil? && event.server.id==256291408598663168
  for i in 0...itz.length
    return itz[i] if itz[i][0].gsub(' ','').downcase==name.gsub(' ','').downcase && m.include?(itz[i][1])
  end
  for i in alz
    return x_find_item(game,i[1],event) if i[0].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
  end
  unless fullname
    for i in 0...itz.length
      return itz[i] if itz[i][0][0,name.length].gsub(' ','').downcase==name.gsub(' ','').downcase && m.include?(itz[i][1])
    end
    for i in alz
      return x_find_item(game,i[1],event) if i[0][0,name.length].gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
      return x_find_item(game,i[1],event) if i[0][0,name.length].gsub('||','').gsub(' ','').downcase==name.gsub(' ','').downcase && (i[3].nil? || i[3].include?(g))
    end
  end
  return ["kvsnokfdn"]
end

def find_item(game,name,event,fullname=false,everything=false)
  return x_find_item(game,name,event,fullname,everything) unless x_find_item(game,name,event,fullname,everything)==["kvsnokfdn"]
  if x_find_item(game,name,event,fullname,everything)==["kvsnokfdn"]
    args=name.split(' ')
    for i in 0...args.length
      return x_find_item(game,args[0,args.length-i].join(' '),event,fullname,everything) unless x_find_item(game,args[0,args.length-i].join(' '),event,fullname,everything)==["kvsnokfdn"]
    end
    for i in 0...args.length
      return x_find_item(game,args[i,args.length-i].join(' '),event,fullname,everything) unless x_find_item(game,args[i,args.length-i].join(' '),event,fullname,everything)==["kvsnokfdn"]
      for j in 0...args.length-i
        return x_find_item(game,args[i,args.length-i-j].join(' '),event,fullname,everything) unless x_find_item(game,args[i,args.length-i-j].join(' '),event,fullname,everything)==["kvsnokfdn"]
      end
    end
  end
  return nil
end

def parse_args(event,game,args,lil=true,mde=0)
  args2=args
  for i in 0...args2.length
    args2[i]=namecheck(args2[i],event) if args2[i].include?('!')
  end
  mem=args2.join(' ')
  apt=0
  for i in 0...args.length
    if args[i].downcase=="aptitude"[0,args[i].length]
      apt=10
      apt=20 if game=="Awakening"
      apt=20 if game=="Three Houses"
      args[i]=nil
    end
  end
  args.compact!
  ##### parsing the order of words #####
  if !find_unit(game,args[0].downcase,event).nil?
    unit1=find_unit(game,args[0].downcase,event)
    args[0]=nil
    args.compact!
    if args.length>0
      if !find_unit(game,args[0].downcase,event).nil?
        unit2=find_unit(game,args[0].downcase,event)
        args[0]=nil
        args.compact!
        if args.length>0
          if !find_unit(game,args[0].downcase,event).nil?
            unit3=find_unit(game,args[0].downcase,event)
            args[0]=nil
            args.compact!
            if args.length>0
              if !find_unit(game,args[0].downcase,event).nil?
                unit4=find_unit(game,args[0].downcase,event)
                args[0]=nil
                args.compact!
              elsif !find_unit(game,args[args.length-1].downcase,event).nil?
                unit4=find_unit(game,args[args.length-1].downcase,event)
                args[args.length-1]=nil
                args.compact!
              end
            end
          elsif !find_unit(game,args[args.length-1].downcase,event).nil?
            unit3=find_unit(game,args[args.length-1].downcase,event)
            args[args.length-1]=nil
            args.compact!
            if args.length>0
              if !find_unit(game,args[args.length-1].downcase,event).nil?
                unit4=find_unit(game,args[args.length-1].downcase,event)
                args[args.length-1]=nil
                args.compact!
              end
            end
          end
        end
      elsif !find_unit(game,args[args.length-1].downcase,event).nil?
        unit2=find_unit(game,args[args.length-1].downcase,event)
        args[args.length-1]=nil
        args.compact!
        if args.length>0
          if !find_unit(game,args[args.length-1].downcase,event).nil?
            unit3=find_unit(game,args[args.length-1].downcase,event)
            args[args.length-1]=nil
            args.compact!
            if args.length>0
              if !find_unit(game,args[args.length-1].downcase,event).nil?
                unit4=find_unit(game,args[args.length-1].downcase,event)
                args[args.length-1]=nil
                args.compact!
              end
            end
          end
        end
      end
    end
    clss=find_class(args.join(' ').downcase,event) if args.length>0
  elsif !find_unit(game,args[args.length-1].downcase,event).nil?
    unit1=find_unit(game,args[args.length-1].downcase,event)
    args[args.length-1]=nil
    args.compact!
    if args.length>0
      if !find_unit(game,args[args.length-1].downcase,event).nil?
        unit2=find_unit(game,args[args.length-1].downcase,event)
        args[args.length-1]=nil
        args.compact!
        if args.length>0
          if !find_unit(game,args[args.length-1].downcase,event).nil?
            unit3=find_unit(game,args[args.length-1].downcase,event)
            args[args.length-1]=nil
            args.compact!
            if args.length>0
              if !find_unit(game,args[args.length-1].downcase,event).nil?
                unit4=find_unit(game,args[args.length-1].downcase,event)
                args[args.length-1]=nil
                args.compact!
              end
            end
          end
        end
      end
    end
    clss=find_class(args.join(' ').downcase,event) if args.length>0
  elsif !find_class(args.join(' ').downcase,event).nil?
    clss=find_class(args.join(' ').downcase,event)
  end
  if clss.nil?
    for i in 0...args.length-1
      args[args.length-1]=nil
      args.compact!
      clss=find_class(args.join(' ').downcase,event) if clss.nil?
    end
  end
  if clss.nil? && unit1.nil?
    event.respond("Please include a class name and/or a unit name.") if mde==0
    return nil
  end
  if unit1=="Lilith"
    return "L" unless lil
    unit1=unit2
    unit2=unit3
    unit3=unit4
    unit4=nil
    if unit1=="Lilith"
      unit1=unit2
      unit2=unit3
      unit3=nil
      if unit1=="Lilith"
        unit1=unit2
        unit2=nil
        unit1=nil if unit1=="Lilith"
      end
    end
  end
  if unit2=="Lilith"
    unit2=unit3
    unit3=unit4
    unit4=nil
    if unit2=="Lilith"
      unit2=unit3
      unit3=nil
      unit3=nil if unit3=="Lilith"
    end
  end
  if unit3=="Lilith"
    unit3=unit4
    unit4=nil
    unit3=nil if unit3=="Lilith"
  end
  if unit4=="Lilith"
    unit4=nil
  end
  g=game
  step1=generation_parse(event,unit1,unit2,unit3,unit4,false)
  unless step1.nil?
    kidname=step1[0]
    unless clss.nil? || !["fe!","fe?"].include?(event.message.text[0,3].downcase)
      f=find_unit(game,kidname,event)
      g="Three Houses" if f[1][2]=='T'
      g="Fates" if f[1][2]=='F'
      g="Awakening" if f[1][2]=='A'
      apt=20 if apt>0 && ["Awakening","Three Houses"].include?(g)
      clss=find_class(clss[0],event,g)
    end
    mother=step1[1]
    grandmother=step1[2]
    step2=unit_creation(step1,unit1,unit2,unit3,unit4,event)
  end
  ### generating unit ###
  if !kidname.nil?
    unit=[]
    if !grandmother.nil?
      # three generations
      parent=create_kid(event,mother,step2[2],1,false)
      unit=create_kid(event,kidname,parent,0)
      picture=get_picture(kidname,mother,grandmother,unit[1][1,1],event)
    elsif !mother.nil?
      # two generations
      unit=create_kid(event,kidname,step2[1])
      picture=get_picture(kidname,mother,nil,unit[1][1,1],event)
    else
      # one generation
      unit=step2[0]
      if unit[5].nil? || unit[5][0].nil? || unit[5][0]==''
        unit[5]=[] if unit[5].nil?
        unit[5][0]=gender_adjust("Nohr Royal",unit[1][1,1])
      end
      if kidname=="Portia"
        unit[5].push('Dark Mage')
      end
      data_load()
      unless unit[1][2]=='T'
        for i in 0...unit[5].length
          clss22=unit[5][i]
          clss22=gender_adjust(clss22,unit[1][1,1])
          if clss22[0,10]=='Troubadour'
            if unit[1][2,1]=='A'
              unit[5][i]='Troubadour (War Cleric, Valkyrie)'
            elsif unit[1][1,1]=='m'
              unit[5][i]='Troubadour (Butler, Strategist)'
            elsif unit[1][1,1]=='f'
              unit[5][i]='Troubadour (Maid, Strategist)'
            else
              unit[5][i]='Troubadour (Servant, Strategist)'
            end
          else
            unit[5][i]=clss22
            m=@classes.find_index{|q| q[0]==clss22 && q[1][0,1]==unit[1][2,1]}
            unit[5][i]="#{clss22} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0
          end
        end
      end
      unit[0]="**#{unit[0]}**"
      picture=get_picture(kidname,nil,nil,unit[1][1,1],event)
    end
  end
  ### generating class ###
  unless clss.nil?
    if clss[0][0,6]=="Taguel"
      clss=find_class("Taguel (C)",event) if !event.message.text.downcase.include?('(f)') && !event.message.text.downcase.include?('(m)')
      clss=find_class("Taguel (#{unit[1][1,1].upcase})",event) unless unit.nil?
    elsif clss[0][0,10]=="Great Lord" && clss[1]=="Awakening"
      clss=find_class("Great Lord (C)",event) if !event.message.text.downcase.include?('(f)') && !event.message.text.downcase.include?('(m)')
      clss=find_class("Great Lord (#{unit[1][1,1].upcase})",event) unless unit.nil?
    end
  end
  return [unit,clss,apt,mem,g,step1]
end

def get_mode(message)
  return "FEA!" if message[0,4].downcase=="fea!"
  return "FEA!" if message[0,5].downcase=="fe13!"
  return "FEA!" if message[0,4].downcase=="fea?"
  return "FEA!" if message[0,5].downcase=="fe13?"
  return "FEf!" if message[0,4].downcase=="fef!"
  return "FEf!" if message[0,5].downcase=="fe14!"
  return "FEf!" if message[0,4].downcase=="fef?"
  return "FEf!" if message[0,5].downcase=="fe14?"
  return "FE3H!" if message[0,3].downcase=="3h!"
  return "FE3H!" if message[0,5].downcase=="fe3h!"
  return "FE3H!" if message[0,5].downcase=="feth!"
  return "FE3H!" if message[0,5].downcase=="fe16!"
  return "FE3H!" if message[0,3].downcase=="3h?"
  return "FE3H!" if message[0,5].downcase=="fe3h?"
  return "FE3H!" if message[0,5].downcase=="feth?"
  return "FE3H!" if message[0,5].downcase=="fe16?"
  return "FE!"
end

def get_boon(game,stat)
  if game=="Fates"
    if stat=="HP"
      return [[0,1,1,0,0,2,2,2],[15,0,0,0,0,0,5,5]]
    elsif stat=="Str"
      return [[0,4,0,2,0,0,2,0],[0,15,0,5,0,0,5,0]]
    elsif stat=="Mag"
      return [[0,0,4,0,2,0,0,2],[0,0,20,0,5,0,0,5]]
    elsif stat=="Skl"
      return [[0,2,0,4,0,0,2,0],[0,5,0,25,0,0,5,0]]
    elsif stat=="Spd"
      return [[0,0,0,2,4,2,0,0],[0,0,0,5,15,5,0,0]]
    elsif stat=="Lck"
      return [[0,2,2,0,0,4,0,0],[0,5,5,0,0,25,0,0]]
    elsif stat=="Def"
      return [[0,0,0,0,0,2,4,2],[0,0,0,0,0,5,10,5]]
    elsif stat=="Res"
      return [[0,0,2,0,2,0,0,4],[0,0,5,0,5,0,0,10]]
    else
      return [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
    end
  elsif game=="Awakening"
    if stat=="HP"
      return [[0,1,1,0,0,2,2,2],[30,0,0,0,0,0,5,5]]
    elsif stat=="Str"
      return [[0,4,0,2,0,0,2,0],[0,15,0,5,0,0,5,0]]
    elsif stat=="Mag"
      return [[0,0,4,0,2,0,0,2],[0,0,15,0,5,0,0,5]]
    elsif stat=="Skl"
      return [[0,2,0,4,0,0,2,0],[0,5,0,15,0,0,5,0]]
    elsif stat=="Spd"
      return [[0,0,0,2,4,2,0,0],[0,0,0,5,15,5,0,0]]
    elsif stat=="Lck"
      return [[0,2,2,0,0,4,0,0],[0,5,5,0,0,15,0,0]]
    elsif stat=="Def"
      return [[0,0,0,0,0,2,4,2],[0,0,0,0,0,5,15,5]]
    elsif stat=="Res"
      return [[0,0,2,0,2,0,0,4],[0,0,5,0,5,0,0,15]]
    else
      return [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
    end
  end
end

def get_bane(game,stat)
  if game=="Fates"
    if stat=="HP"
      return [[0,-1,-1,0,0,-1,-1,-1],[-10,0,0,0,0,0,-5,-5]]
    elsif stat=="Str"
      return [[0,-3,0,-1,0,0,-1,0],[0,-10,0,-5,0,0,-5,0]]
    elsif stat=="Mag"
      return [[0,0,-3,0,-1,0,0,-1],[0,0,-15,0,-5,0,0,-5]]
    elsif stat=="Skl"
      return [[0,-1,0,-3,0,0,-1,0],[0,-5,0,-20,0,0,-5,0]]
    elsif stat=="Spd"
      return [[0,0,0,-1,-3,-1,0,0],[0,0,0,-5,-10,-5,0,0]]
    elsif stat=="Lck"
      return [[0,-1,-1,0,0,-3,0,0],[0,-5,-5,0,0,-15,0,0]]
    elsif stat=="Def"
      return [[0,0,0,0,0,-1,-3,-1],[0,0,0,0,0,-5,-10,-5]]
    elsif stat=="Res"
      return [[0,0,-1,0,-1,0,0,-3],[0,0,-5,0,-5,0,0,-10]]
    else
      return [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
    end
  elsif game=="Awakening"
    if stat=="HP"
      return [[0,-1,-1,0,0,-1,-1,-1],[-20,0,0,0,0,0,-5,-5]]
    elsif stat=="Str"
      return [[0,-3,0,-1,0,0,-1,0],[0,-10,0,-5,0,0,-5,0]]
    elsif stat=="Mag"
      return [[0,0,-3,0,-1,0,0,-1],[0,0,-10,0,-5,0,0,-5]]
    elsif stat=="Skl"
      return [[0,-1,0,-3,0,0,-1,0],[0,-5,0,-10,0,0,-5,0]]
    elsif stat=="Spd"
      return [[0,0,0,-1,-3,-1,0,0],[0,0,0,-5,-10,-5,0,0]]
    elsif stat=="Lck"
      return [[0,-1,-1,0,0,-3,0,0],[0,-5,-5,0,0,-10,0,0]]
    elsif stat=="Def"
      return [[0,0,0,0,0,-1,-3,-1],[0,0,0,0,0,-5,-10,-5]]
    elsif stat=="Res"
      return [[0,0,-1,0,-1,0,0,-3],[0,0,-5,0,-5,0,0,-10]]
    else
      return [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
    end
  end
end

def parse_job(event,args,bot,mde=0)
  args=splice(event)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  if args.nil?
    event.respond("Please include a class name and/or a unit name.") if mde==0
    return -1
  elsif args.length.zero?
    event.respond("Please include a class name and/or a unit name.") if mde==0
    return -1
  end
  f=parse_args(event,game,args,false,mde)
  if f=="L"
    create_embed(event,"__**Lilith**__","*Fates*: Protector of My Castle\n**HP:** *Max:* 60\n**Strength:** *Max:* 28\n**Magic:** *Max:* 35\n**Skill:** *Max:* 29\n**Speed:** *Max:* 33\n**Luck:** *Max:* 35\n**Defense:** *Max:* 30\n**Resistance:** *Max:* 35\n**Default Class:** Astral Dragon\n**Cannot use Seals**",embed_color("*Fates*: Available in all routes"),nil,'https://vignette2.wikia.nocookie.net/fireemblem/images/f/ff/4Koma_Lilith.png/revision/latest?cb=20160817053542',nil,2)
    return 0
  elsif f.nil?
    event.respond("Please include a class name and/or a unit name.") if mde==0
    return -1
  end
  unit=f[0]
  clss=f[1]
  apt=f[2]
  mem=f[3]
  g=f[4]
  step1=f[5]
  ### displaying data ###
  if unit.nil? && clss.nil?
    event.respond("Please include a class name and/or a unit name.") if mde==0
    return -1
  elsif unit.nil? # no unit defined
    class_parse(event,bot,args)
    return 0
  elsif clss.nil? # no class defined
    step1.compact!
    unless step1.length<3
      if step1[2].include?("!Oregano")
        step1=[step1[0],step1[1],"Oregano",step1[2][0,step1[2].length-8]]
      end
    end
    step1.push("Aptitude") if apt>0
    unit_parse(event,bot,step1.compact)
    return 0
  else # both defined
    disp="__**#{gender_adjust(clss[0],unit[1][1,1],true,g).gsub(' (C)','')}**!#{unit[0]}#{" (with *Aptitude*)" if apt>0}__"
    data_load()
    f=find_unit(game,unit[0].gsub('**','').gsub('__','').split('!')[-1],event)
    if apt>0 && game==""
      apt=10
      apt=20 if ["A","T"].include?(f[1][2])
    end
    untname=f[0]
    untname=f[0].split(' ')[0]
    prf=@items.find_index{|q| !q[1].nil? && !q[3].nil? && q[3].gsub('*','').split(', ').include?(untname) && q[1][0].gsub('G','F')==f[1][2]}
    unless prf.nil?
      prf=@items[prf]
      prf[2][0]=prf[2][0].gsub('Katana','Sword').gsub('Naginata','Lance').gsub('Club','Lance').gsub('Rod','Staff').gsub('White Magic','Staff').gsub('Yumi','Bow').gsub('Scroll','Tome').gsub('Black Magic','Tome').gsub('Dark Magic','Tome').gsub('Shuriken','Dagger')
      prf[2][0]='Tome' if prf[2][0]=='Equipment' && prf[2][1]=='Staff'
      prf[2][0]="#{prf[2][0]}s".gsub('staffs','staves')
    end
    prf=['Liliputia','Gates',['Staves']] if f[0]=='Mathoo'
    text=""
    flds=[]
    m=['HP','Strength','Magic','Skill','Speed','Luck','Defense','Resistance']
    m=['HP','Strength','Magic','Dexterity','Speed','Luck','Defense','Resistance','Charm'] if unit[1][2]=='T' || clss[1]=='Three Houses'
    f=[0,0,0]
    flds=[["**Growth Rates**",[]],["**Maximum Stats**",[]]]
    flds=[["**Growth Rates**",[]],["**Base Stats**",[]],["**Maximum Stats**",[]]] if unit[1][2]=='T'
    for i in 0...m.length
      unit[3][i]=0 if unit[3][i].nil?
      unit[4][i]=0 if unit[4][i].nil?
      clss[3][i]=0 if clss[3][i].nil?
      clss[4][i]=0 if clss[4][i].nil?
      clss[5][i]=0 if clss[5][i].nil?
      flds[0][1].push("*#{m[i]}:*  #{unit[3][i]+clss[3][i]+apt}%")
      f[0]+=unit[3][i]+clss[3][i]+apt
      if unit[1][2]=='T' && clss[1]=='Three Houses'
        flds[1][1].push("*#{m[i]}:*  #{[unit[4][i],clss[5][i]].max}")
        f[1]+=[unit[4][i],clss[5][i]].max
        flds[2][1].push("*#{m[i]}:*  #{unit[5][i]}")
        f[2]+=unit[5][i]
      elsif unit[1][2]=='T'
        flds[1][1].push("*#{m[i]}:*  #{[unit[4][i],clss[5][i]].max}")
        f[1]+=[unit[4][i],clss[5][i]].max
        flds[2][1].push("*#{m[i]}:*  #{(unit[5][i]+clss[4][i])/2}")
        f[2]+=(unit[5][i]+clss[4][i])/2
      elsif clss[1]=='Three Houses'
        flds[1][1].push("*#{m[i]}:*  #{unit[4][i]+clss[4][i]*5/2}")
        f[1]+=unit[4][i]+clss[4][i]*5/2
      else
        flds[1][1].push("*#{m[i]}:*  #{unit[4][i]+clss[4][i]}")
        f[1]+=unit[4][i]+clss[4][i]
      end
    end
    for i in 0...flds.length
      flds[i][1].push('')
      flds[i][1].push("*Total:*  #{f[i]}#{'%' if i==0}")
      flds[i][1]=flds[i][1].join("\n")
    end
    unless prf.nil?
      if clss[9].find_index{|q| q[0]==prf[2][0] || (prf[2][0]=='Tomes' && ['Reason','Faith'].include?(q[0]))}.nil? && !(clss[1]=='Three Houses' && prf[2][0]!='Tomes')
        text="#{text}\n#{unit[0].gsub('**','').gsub('__','').split('!')[-1]} cannot use #{prf[0]} in the #{gender_adjust(clss[0],unit[1][1,1],true,g)} class"
      else
        text="#{text}\n#{unit[0].gsub('**','').gsub('__','').split('!')[-1]} can use #{prf[0]} in the #{gender_adjust(clss[0],unit[1][1,1],true,g)} class"
      end
    end
    text="#{text}\n~~Please note that stat maximums do not account for statue bonuses~~" unless g=="Awakening"
    xcolor=embed_color_x(unit[2],clss,g)
    unless unit[1]=="Cross-game child"
      xcolor=0x02010A if clss[1][0]!=unit[1][2]
    end
    xstats=find_stats_in_string(event)
    game=game_proc(event)
    if step1[0].downcase=="robin" || (!step1[1].nil? && step1[1].downcase=="robin") || (!step1[2].nil? && step1[2].downcase=="robin")
      if (game=="Awakening" || (game != "Fates" && (xstats[0].length>0 || xstats[1].length>0) && !mentions_avatar_kid(event,"Fates")))
        foot="Robin: +#{xstats[0]}, -#{xstats[1]}"
      else
        foot="Robin: Amiibo"
      end
    elsif step1[0].downcase=="morgan"
      foot="Robin: +#{xstats[0]}, -#{xstats[1]}"
    end
    foot2=nil
    if step1[0].downcase=="corrin" || (!step1[1].nil? && step1[1].downcase=="corrin") || (!step1[2].nil? && step1[2].downcase=="corrin")
      if (game=="Fates" || (game != "Awakening" && (xstats[0].length>0 || xstats[1].length>0) && !mentions_avatar_kid(event,"Awakening")))
        foot2="Corrin: +#{xstats[0]}, -#{xstats[1]}"
      else
        foot2="Corrin: Default"
      end
    elsif step1[0].downcase=="kana"
      foot2="Corrin: +#{xstats[0]}, -#{xstats[1]}"
    end
    if foot.nil?
      foot=foot2
    else
      foot="#{foot} / #{foot2}" unless foot2.nil?
    end
    xpic=nil
    xpic="http://pre02.deviantart.net/8b57/th/pre/f/2016/156/d/6/bride_sakura_by_rot8erconex-da4y62l.png" if disp=="__**Bride**!**Sakura**__"
    xpic="http://orig14.deviantart.net/9122/f/2016/156/1/f/maid_cordelia_by_rot8erconex-da4zrei.png" if disp=="__**Maid**!**Cordelia**__"
    create_embed(event,disp,text,xcolor,foot,xpic,flds,2)
    return 0
  end
end

def skill_parse(event,bot,args)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  if args.nil?
    event.respond "Please include a skill name"
    return nil
  elsif args.length.zero?
    event.respond "Please include a skill name"
    return nil
  end
  name=args.join(' ')
  bob4=find_skill(game,name,event)
  if bob4==nil
    event.respond "Please include a skill name"
    return nil
  end
  skillA=find_skill("Awakening",name,event)
  skillA=[] unless ["Awakening","Fateswakening"].include?(skillA[1])
  skillF=find_skill("Fates",name,event)
  skillF=[] unless ["Gates","Fates","Fateswakening"].include?(skillF[1])
  skillT=find_skill("Three Houses",name,event)
  skillT=[] unless "Three Houses"==skillT[1]
  sklist=[skillA.map{|q| q}, skillF.map{|q| q}, skillT.map{|q| q}].reject{|q| q.length<=0}
  sklist=sklist.reject{|q| q[0]!=sklist[-1][0]}
  if game=="" && sklist.length>1
    fullname="__**#{bob4[0]}**__"
    text='**Availability:**'
    if sklist.map{|q| q[2]}.uniq.length>1
      fateswakening=false
      fateswakening=true if skillA.length>0 && skillF.length>0 && skillA==skillF
      if skillA.length>0
        sA=[]
        for i in 0...skillA[2].length
          m=skillA[2][i]
          if ['Enemy exclusive','Enemy-exclusive','Enemy'].include?(m[0])
            sA.push('Enemy exclusive')
          elsif m[1].nil?
            sA.push(m[0])
          elsif m[1]=='personal'
            sA.push("#{m[0]}'s unique skill (can be passed to Morgan)")
          else
            sA.push("#{m[0]} [level #{m[1]}]")
          end
        end
        text="#{text}\n*Awakening#{'/Fates' if fateswakening}:*  #{sA.join(', ')}"
      end
      if skillF.length>0 && !fateswakening
        sF=[]
        for i in 0...skillF[2].length
          m=skillF[2][i]
          if ['Enemy exclusive','Enemy-exclusive','Enemy'].include?(m[0])
            sF.push('Enemy exclusive')
          elsif m[1].nil?
            sF.push(m[0])
          elsif m[1]=='personal'
            if m[0]=='-'
              sF.push("possible personal skill for Bond Units")
            else
              sF.push("#{m[0]}'s personal skill")
            end
          else
            sF.push("#{m[0]} [level #{m[1]}]")
          end
        end
        text="#{text}\n*Fates:*  #{sF.join(', ')}"
      end
      if skillT.length>0
        sT=[]
        for i in 0...skillT[2].length
          m=skillT[2][i]
          if ['Enemy exclusive','Enemy-exclusive','Enemy'].include?(m[0])
            sT.push('Enemy exclusive')
          elsif m[1].nil?
            sT.push(m[0])
          elsif m[1]=='skill'
            if m.length<=3
              sT.push("unit's #{m[0]} reaches #{m[2]} Rank")
            elsif m.length==4
              sT.push("#{m[3]}'s #{m[0]} reaches #{m[2]} Rank")
            else
              sT.push("Reach #{m[2]} Rank in #{m[0]} with #{list_lift(m[3,m.length-3],'or')}")
            end
          elsif m[1]=='personal'
            if m[0]=='-'
              sT.push("possible personal skill for Bond Units")
            else
              sT.push("#{m[0]}'s personal skill")
            end
          else
            sT.push("#{m[0]} [#{m[1].gsub('class','class skill')}]")
          end
        end
        text="#{text}\n*Three Houses:*  #{sT.join(', ')}"
      end
    else
      sB=[]
      for i in 0...bob4[2].length
        m=bob4[2][i]
        if ['Enemy exclusive','Enemy-exclusive','Enemy'].include?(m[0])
          sB.push('Enemy exclusive')
        elsif m[1].nil?
          sB.push(m[0])
        elsif m[1]=='skill'
          if m.length<=3
            sB.push("unit's #{m[0]} reaches #{m[2]} Rank")
          elsif m.length==4
            sB.push("#{m[3]}'s #{m[0]} reaches #{m[2]} Rank")
          else
            sB.push("Reach #{m[2]} Rank in #{m[0]} with #{list_lift(m[3,m.length-3],'or')}")
          end
        elsif m[1]=='personal'
          if m[0]=='-'
            sB.push("possible personal skill for Bond Units")
          else
            sB.push("#{m[0]}'s personal/unique skill (in *Awakening*, can be passed to Morgan)")
          end
        else
          sB.push("#{m[0]} [level #{m[1]}]")
        end
      end
      text="#{text}  #{sB.join(', ')}"
    end
    if bob4[3]!="-"
      if bob4[3][bob4[3].length-8,8].downcase==" command"
        text="#{text}\n**Usage:** #{bob4[3]}"
      else
        text="#{text}\n**Trigger rate:** #{bob4[3]}"
        text="#{text}  ~~(The Skill stat is called Dexterity in 3H)~~" if bob4[3].include?('Skill') && skillT.length>0
      end
    end
    if sklist.map{|q| q[4]}.uniq.length<=1
      text="#{text}\n**Effect:** #{bob4[4].gsub('/*','\\*')}"
    elsif bob4[0]=="Lethality"
      text="#{text}\n**Effect:** #{skillA[4].gsub('/*','\\*')} (In *Fates* and *Three Houses*, does not work if the user would deal 0 damage)"
    elsif bob4[0]=="Galeforce"
      text="#{text}\n**Effect:** #{skillA[4].gsub('/*','\\*')} (In *Fates*, this does not trigger in Attack or Guard Stance)"
    else
      if skillA.length>0 && skillF.length>0 && skillA[4]==skillF[4]
        text="#{text}\n***Awakening/Fates*** **Effect:** #{skillA[4].gsub('/*','\\*')}" if skillA.length>0
      else
        text="#{text}\n***Awakening*** **Effect:** #{skillA[4].gsub('/*','\\*')}" if skillA.length>0
        text="#{text}\n***Fates*** **Effect:** #{skillF[4].gsub('/*','\\*')}" if skillF.length>0
      end
      text="#{text}\n***Three Houses*** **Effect:** #{skillT[4].gsub('/*','\\*')}" if skillT.length>0
    end
    xcolor=0x010101
    xcolor=0x061069 if bob4[0]=="Acrobat" && (event.server.nil? || event.server.id != 256291408598663168)
  else
    fullname="__**#{bob4[0]}**__"
    text='**Availability:**'
    sB=[]
    alignment=[]
    for i in 0...bob4[2].length
      m=bob4[2][i]
      if ['Enemy exclusive','Enemy-exclusive','Enemy'].include?(m[0])
        sB.push('Enemy exclusive')
      elsif m[1].nil?
        sB.push(m[0])
      elsif m[1]=='skill'
        if m.length<=3
          sB.push("unit's #{m[0]} reaches #{m[2]} Rank")
        elsif m.length==4
          sB.push("#{m[3]}'s #{m[0]} reaches #{m[2]} Rank")
        else
          sB.push("Reach #{m[2]} Rank in #{m[0]} with #{list_lift(m[3,m.length-3],'or')}")
        end
      elsif m[1]=='personal'
        if m[0]=='-'
          sB.push("possible personal skill for Bond Units")
        else
          if bob4[1]=='Fates' || bob4[1]=='Gates' || bob4[1]=='Three Houses' || (bob4[1]=="Fateswakening" && ['Fates','Gates'].include?(game))
            sB.push("#{m[0]}'s personal skill")
          elsif bob4[1]=='Awakening' || (bob4[1]=="Fateswakening" && game=="Awakening")
            sB.push("#{m[0]}'s unique skill (can be passed to Morgan)")
          else
            sB.push("#{m[0]}'s personal/unique skill (in *Awakening*, can be passed to Morgan)")
          end
          if bob4[1]=="Fates" || (bob4[1]=="Fateswakening" && game=="Fates")
            a=@units[@units.find_index{|q| q[0]==m[0] && q[1][2,1]=='F'}][1][3]
            alignment.push('Hoshido') if a=='b'
            alignment.push('Nohr') if a=='c'
            alignment.push('Valla') if a=='r'
            alignment.push('Penumbra') if a=='g'
          elsif bob4[1]=="Three Houses"
            a=@units[@units.find_index{|q| (q[0]==m[0] || q[0].split(' ')[0]==m[0]) && q[1][2,1]=='T'}][1][3]
            alignment.push('Adrestia') if a=='r'
            alignment.push('Faerghus') if a=='b'
            alignment.push('Leicester') if a=='y'
            alignment.push('Garreg Mach') if a=='k' || a=='g'
          end
        end
      elsif bob4[1]=="Three Houses"
        sB.push("#{m[0]} [#{m[1].gsub('class','class skill')}]")
        x=@classes[@classes.find_index{|q| q[0].gsub(' ','')==m[0].gsub(' ','') && q[1]=='Three Houses'}]
        alignment.push(x[2]) unless x[2]=='Garreg Mach' && x[0]!='Archbishop'
        alignment.push('generic') if x[2]=='Garreg Mach' && x[0]!='Archbishop'
      else
        sB.push("#{m[0]} [level #{m[1]}]")
        alignment.push(@classes[@classes.find_index{|q| q[0].split('(')[0].gsub(' ','')==m[0].split('(')[0].gsub(' ','') && q[1]=='Fates'}][2]) if bob4[1]=="Fates" || (bob4[1]=="Fateswakening" && game=="Fates")
      end
    end
    if sB.reject{|q| !q.include?(',')}.length>0 && sB.length>1
      text="__**Availability**__\n#{sB.join("\n")}"
    else
      text="#{text}  #{sB.join(', ')}"
    end
    if bob4[3]!="-"
      if bob4[3][bob4[3].length-8,8].downcase==" command"
        text="#{text}\n**Usage:** #{bob4[3]}"
      elsif bob4[0]=="Vengeance" && event.message.text[0,3].downcase != "fe!"
        text="#{text}\n**Trigger rate:** (Skill * 1.5)%" if game=="Fates"
        text="#{text}\n**Trigger rate:** (Skill * 2)%" if game=="Awakening"
      else
        text="#{text}\n**Trigger rate:** #{bob4[3]}"
      end
    end
    text="#{text}\n**Effect:** #{bob4[4].gsub('/*','\\*')}"
    xcolor=0x010101
    xcolor=0x061069 if bob4[1]=="Awakening" || (bob4[1]=="Fateswakening" && game=="Awakening")
    if bob4[1]=="Fates" || (bob4[1]=="Fateswakening" && game=="Fates")
      xcolor=0xC5EEF2
      if alignment.uniq.length==1
        a=alignment[0]
        xcolor=0xCF000D if a=='Hoshido'
        xcolor=0xAA7FCD if a=='Nohr'
        xcolor=0x2DA5AF if a=='Valla'
        xcolor=0xFFEA8B if a=='Penumbra'
      end
    elsif bob4[1]=="Three Houses"
      xcolor=0x2D6864
      if alignment.uniq.length==1
        a=alignment[0]
        xcolor=0x7D171F if a=='Adrestia'
        xcolor=0x4B4E9B if a=='Faerghus'
        xcolor=0x897A04 if a=='Leicester'
        xcolor=0x8A8D94 if a=='Underground'
        xcolor=0x565562 if a=='Garreg Mach'
        xcolor=0xA9AA9D if a=='Agartha'
      end
    end
    xcolor=0xFFEA8B if bob4[1]=="Gates"
    xcolor=0x061069 if bob4[0]=="Acrobat" && (event.server.nil? || event.server.id != 256291408598663168)
  end
  create_embed(event,fullname,text,xcolor,nil,"https://inheritance-planner.herokuapp.com/images/skills/#{bob4[0].downcase.gsub(' ','').gsub('+','')}.png")
  return nil
end

def item_parse(event,bot,args,mde=0)
  args=splice(event)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  if args.nil? || args.length.zero?
    event.respond "Please include an item name" if mde==0
    return nil
  end
  upgrade=0
  for i in 0...args.length
    if args[i]=='+'
      upgrade=1 if upgrade==0
      args[i]=nil
    elsif args[i][0,1]=="+" && args[i][1,1].to_i>0 && args[i][1,1].to_i<8
      upgrade=args[i][1,1].to_i if upgrade==0
      args[i]=nil
    elsif args[i][-1]=='+'
      upgrade=1 if upgrade==0
      args[i]=args[i][0,args[i].length-1]
    end
  end
  args.compact!
  name=args.join(' ')
  bob4=find_item(game,name,event)
  if bob4.nil? || bob4.length<=2
    event.respond "Please include an item name" if mde==0
    return nil
  end
  text=''
  itemA=find_item("Awakening",bob4[0],event)
  itemA=[] unless ["Awakening","Fateswakening"].include?(itemA[1])
  itemF=find_item("Fates",bob4[0],event)
  itemF=[] unless ["Fates","Fateswakening"].include?(itemF[1])
  itemT=find_item("Three Houses",bob4[0],event)
  itemT=[] unless ["Three Houses"].include?(itemT[1])
  itemlst=[itemA.map{|q| q}, itemF.map{|q| q}, itemT.map{|q| q}].reject{|q| q.length<=0}
  itemlst=itemlst.reject{|q| q[0]!=itemlst[-1][0]}
  text=''
  if game=="" && itemlst.length>1
    xcolor=0x010101
    if ["staff","rod"].include?(itemlst[0][2][0].downcase)
      fullname="__**#{bob4[0]}**__"
      unless itemA.length<=0
        h=itemA[4][1]
        h="Always hits" if h=="-"
        if itemA[6][0] == "-"
          p="Not purchaseable or sellable"
        elsif !itemA[6][1].nil?
          p="#{longFormattedNumber(itemA[6][0])} (sells for #{longFormattedNumber(itemA[6][0]/4)})"
        else
          p="#{longFormattedNumber(itemA[6][0])} (sells for #{longFormattedNumber(itemA[6][0]/2)})"
        end
        text="__*Awakening*__\n#{itemA[2][1]}-rank #{itemA[2][0]} with #{itemA[4][0]} uses\n**Hit:** #{h}  \u200B  \u200B  \u200B  **Range:** #{itemA[5].gsub('~','-')}\n**EXP Modifier:** #{itemA[4][3]}\n**Cost:** #{p}"
        if itemA[3].nil?
        elsif itemA[3]=='Enemy'
          text="#{text}\n**Enemy exclusive**"
        elsif itemA[3].include?('*')
          text="#{text}\n**Locked to:** #{itemA[3].gsub('*','')}"
        elsif itemA[3].length>0
          text="#{text}\n**Prf to:** #{itemA[3]}"
        end
        text="#{text}\n**Additional info:** #{itemA[7]}" if itemA[7] != '-' && !itemA[7].nil? && itemA[7] != ''
      end
      unless itemF.length<=0
        h=itemF[4][1]
        h="Always hits" if h=="-"
        if itemF[6][0] == "-"
          p="Not purchaseable or sellable"
        elsif !itemF[6][1].nil?
          p="#{longFormattedNumber(itemF[6][0])} (sells for #{longFormattedNumber(itemF[6][0]/4)})"
        else
          p="#{longFormattedNumber(itemF[6][0])} (sells for #{longFormattedNumber(itemF[6][0]/2)})"
        end
        text="#{text}\n\n__*Fates*__\n#{itemF[2][1]}-rank #{itemF[2][0]} with #{itemF[4][0]} uses\n**Hit:** #{h}  \u200B  \u200B  \u200B  **Range:** #{itemF[5].gsub('~','-')}\n**EXP Modifier:** #{itemF[4][3]}\n**Cost:** #{p}"
        if itemF[3].nil?
        elsif itemF[3]=='Enemy'
          text="#{text}\n**Enemy exclusive**"
        elsif itemF[3].include?('*')
          text="#{text}\n**Locked to:** #{itemF[3].gsub('*','')}"
        elsif itemF[3].length>0
          text="#{text}\n**Prf to:** #{itemF[3]}"
        end
        text="#{text}\n**Additional info:** #{itemF[7]}" if itemF[7] != '-' && !itemF[7].nil? && itemF[7] != ''
      end
    else
      itemA=forge(itemA,upgrade,"Awakening") if upgrade>0 && itemA.length>0
      itemF=forge(itemF,upgrade,"Fates") if upgrade>0 && itemF.length>0
      fullname="__**#{bob4[0]}**__"
      unless itemA.length<=0
        if itemA[6][0] == "-"
          p="Not purchaseable or sellable"
        elsif !itemA[6][1].nil?
          p="#{longFormattedNumber(itemA[6][0])} (sells for #{longFormattedNumber(itemA[6][0]/4)})"
        else
          p="#{longFormattedNumber(itemA[6][0])} (sells for #{longFormattedNumber(itemA[6][0]/2)})"
        end
        text="__*Awakening* #{"(+#{[upgrade,5].min})" if upgrade>0}__\n#{itemA[2][1]}-rank #{itemA[2][0]} with #{itemA[4][3]} uses\n**Might:** #{itemA[4][0]}  \u200B  \u200B  \u200B  **Range:** #{itemA[5].gsub('~','-')}\n**Hit:** #{itemA[4][1]}  \u200B  \u200B  \u200B  **Crit:** #{itemA[4][2]}\n**Cost:** #{p}"
        if itemA[3].nil?
        elsif itemA[3]=='Enemy'
          text="#{text}\n**Enemy exclusive**"
        elsif itemA[3].include?('*')
          text="#{text}\n**Locked to:** #{itemA[3].gsub('*','')}"
        elsif itemA[3].length>0
          text="#{text}\n**Prf to:** #{itemA[3]}"
        end
        text="#{text}\n**Additional info:** #{itemA[7]}" if itemA[7] != '-' && !itemA[7].nil? && itemA[7] != ''
      end
      unless itemF.length<=0
        c=itemF[4][2]
        c="Never crits" if itemF[7].downcase.include?("cannot trigger crit") || itemF[7].downcase.include?("cannot crit") || itemF[7].downcase.include?("cannot double attack or inflict crit")
        if itemF[6][0] == "-"
          p="Not purchaseable or sellable"
        elsif !itemF[6][1].nil?
          p="#{longFormattedNumber(itemF[6][0])} (sells for #{longFormattedNumber(itemF[6][0]/4)})"
        else
          p="#{longFormattedNumber(itemF[6][0])} (sells for #{longFormattedNumber(itemF[6][0]/2)})"
        end
        text="#{text}\n\n__*Fates* #{"(+#{upgrade})" if upgrade>0}__\n#{itemF[2][1]}-rank #{itemF[2][0]}\n**Might:** #{itemF[4][0]}  \u200B  \u200B  \u200B  **Range:** #{itemF[5].gsub('~','-')}\n**Hit:** #{itemF[4][1]}  \u200B  \u200B  \u200B  **Crit:** #{c}  \u200B  \u200B  \u200B  **Avoid:** #{itemF[4][3]}\n**Cost:** #{p}"
        if itemF[3].nil?
        elsif itemF[3]=='Enemy'
          text="#{text}\n**Enemy exclusive**"
        elsif itemF[3].include?('*')
          text="#{text}\n**Locked to:** #{itemF[3].gsub('*','')}"
        elsif itemF[3].length>0
          text="#{text}\n**Prf to:** #{itemF[3]}"
        end
        text="#{text}\n**Additional info:** #{itemF[7]}" if itemF[7] != '-' && !itemF[7].nil? && itemF[7] != ''
      end
    end
    if itemT.nil? || itemT.length<=0
    elsif itemT[2][0]=='Equipment'
      text="#{text}\n\n__*Three Houses*__"
      text="#{text}\n**Protection:** #{itemT[4][1]}  \u200B  \u200B  \u200B  **Resilience:** #{itemT[4][2]}"
      text="#{text}\n**Crit:** #{itemT[4][3]}" unless itemT[4][3]==0
      text="#{text}\n**Weight:** #{itemT[4][4]}"
    elsif itemT[2][0]=='White Magic' && itemT[4][4]=='-'
      text="#{text}\n\n__*Three Houses*__"
      text="#{text}\n#{itemT[2][1]}-rank #{itemT[2][0]} with #{itemT[4][0]} uses"
      text="#{text}\n**Heal power:** #{itemT[4][1]}  \u200B  \u200B  \u200B  **Range:** #{itemT[5].gsub('~','-')}" unless itemT[4][1]=='-'
      text="#{text}\n**Hit:** #{itemT[4][2]}#{"  \u200B  \u200B  \u200B  **Range:** #{itemT[5].gsub('~','-')}" if itemT[4][1]=='-'}" unless itemT[4][2]=='-'
      text="#{text}\n**Range:** #{itemT[5].gsub('~','-')}" if itemT[4][1]=='-' && itemT[4][2]=='-'
    elsif ['White Magic','Black Magic','Dark Magic'].include?(itemT[2][0])
      text="#{text}\n\n__*Three Houses*__"
      text="#{text}\n#{itemT[2][1]}-rank #{itemT[2][0]} with #{itemT[4][0]} uses"
      text="#{text}\n**Might:** #{itemT[4][1]}  \u200B  \u200B  \u200B  **Range:** #{itemT[5].gsub('~','-')}"
      text="#{text}\n**Hit:** #{itemT[4][2]}  \u200B  \u200B  \u200B  **Crit:** #{itemT[4][3]}"
      text="#{text}\n**Weight:** #{itemT[4][4]}"
    else
      if upgrade>0 && !@items.find_index{|q| q[0]=="#{itemT[0]}+" && q[1]=='Three Houses'}.nil?
        itemT=@items[@items.find_index{|q| q[0]=="#{itemT[0]}+" && q[1]=='Three Houses'}]
      end
      text="#{text}\n\n__*Three Houses*#{' (+1)' if upgrade>0 && itemT[0][-1]=='+'}__"
      text="#{text}\n#{itemT[2][1]}-rank #{itemT[2][0]}#{" with #{itemT[4][0]} uses" unless itemT[4][0]=='-'}"
      text="#{text}\n**Might:** #{itemT[4][1]}  \u200B  \u200B  \u200B  **Range:** #{itemT[5].gsub('~','-')}"
      text="#{text}\n**Hit:** #{itemT[4][2]}  \u200B  \u200B  \u200B  **Crit:** #{itemT[4][3]}"
      text="#{text}\n**Weight:** #{itemT[4][4]}"
    end
    if itemT.nil? || itemT.length<=0
      if itemT[6][0] == "-"
        p="Not purchaseable or sellable"
      elsif !itemT[6][1].nil?
        p="#{longFormattedNumber(itemT[6][0])} (sells for #{longFormattedNumber(itemT[6][0]/2)})"
      else
        p="#{longFormattedNumber(itemT[6][0])} (sells for #{longFormattedNumber(itemT[6][0]/5)})"
      end
      text="#{text}\n**Cost:** #{p}"
    end
    text="#{text}\n**Additional info:** #{itemT[7]}" if !itemT.nil? && itemT.length>0 && itemT[7]!='-' && !itemT[7].nil? && itemT[7] != ''
  else
    xcolor=0xC5EEF2 if bob4[1]=="Fates"
    xcolor=0xCF000D if ["katana","naginata","club","scroll","shuriken","yumi","rod"].include?(bob4[2][0].downcase)
    xcolor=0xAA7FCD if ["sword","lance","axe","tome","dark tome","dagger","bow","staff"].include?(bob4[2][0].downcase) || ['Grim Yato','Shadow Yato'].include?(bob4[0])
    xcolor=0xC5EEF2 if ['Yato','Alpha Yato','Omega Yato'].include?(bob4[0])
    xcolor=0x061069 if bob4[1]=="Awakening"
    xcolor=0x2D6864 if bob4[1]=="Three Houses"
    fullname="__**#{bob4[0]}**__"
    if bob4[2][0]=='Equipment'
      text="**Protection:** #{bob4[4][1]}  \u200B  \u200B  \u200B  **Resilience:** #{bob4[4][2]}"
      text="#{text}\n**Crit:** #{bob4[4][3]}" unless bob4[4][3]==0
      text="#{text}\n**Weight:** #{bob4[4][4]}"
    elsif bob4[2][0]=='White Magic' && bob4[4][4]=='-'
      text="#{bob4[2][1]}-rank #{bob4[2][0]} with #{bob4[4][0]} uses"
      text="#{text}\n**Heal power:** #{bob4[4][1]}  \u200B  \u200B  \u200B  **Range:** #{bob4[5].gsub('~','-')}" unless bob4[4][1]=='-'
      text="#{text}\n**Hit:** #{bob4[4][2]}#{"  \u200B  \u200B  \u200B  **Range:** #{bob4[5].gsub('~','-')}" if bob4[4][1]=='-'}" unless bob4[4][2]=='-'
      text="#{text}\n**Range:** #{bob4[5].gsub('~','-')}" if bob4[4][1]=='-' && bob4[4][2]=='-'
    elsif ["staff","rod"].include?(bob4[2][0].downcase)
      h=bob4[4][1]
      h="Always hits" if h=="-"
      text="#{bob4[2][1]}-rank #{bob4[2][0]} with #{bob4[4][0]} uses\n**Hit:** #{h}  \u200B  \u200B  \u200B  **Range:** #{bob4[5].gsub('~','-')}"
      text="#{text}\n**EXP Modifier:** #{bob4[4][3]}"
    else
      if upgrade>0
        if bob4[1]=='Three Houses' && !@items.find_index{|q| q[0]=="#{bob4[0]}+" && q[1]=='Three Houses'}.nil?
          bob4=@items[@items.find_index{|q| q[0]=="#{bob4[0]}+" && q[1]=='Three Houses'}]
        elsif bob4[1]!='Three Houses'
          bob4=forge(bob4,upgrade,bob4[1])
        end
      end
      text="#{bob4[2][1]}-rank #{bob4[2][0]}"
      text="#{text} with #{bob4[4][3]} uses" if bob4[1]=="Awakening"
      text="#{text} with #{bob4[4][0]} uses" if bob4[1]=="Three Houses"
      bob4[4].shift
      text="#{text}\n**Might:** #{bob4[4][0]}  \u200B  \u200B  \u200B  **Range:** #{bob4[5].gsub('~','-')}"
      c=bob4[4][2]
      c="Never crits" if bob4[7].downcase.include?("cannot trigger crit") || bob4[7].downcase.include?("cannot crit") || bob4[7].downcase.include?("cannot double attack or inflict crit")
      text="#{text}\n**Hit:** #{bob4[4][1]}  \u200B  \u200B  \u200B  **Crit:** #{c}"
      text="#{text}  \u200B  \u200B  \u200B  **Avoid:** #{bob4[4][3]}" if bob4[1]=="Fates" && bob4[4][3]!=0
      text="#{text}\n**Weight:** #{bob4[4][3]}" if bob4[1]=="Three Houses"
    end
    if bob4[6][0] == "-"
      p="Not purchaseable or sellable"
    elsif bob4[1]=='Three Houses' && !bob4[6][1].nil?
      p="#{longFormattedNumber(bob4[6][0])} (sells for #{longFormattedNumber(bob4[6][0]/2)})"
    elsif bob4[1]=='Three Houses'
      p="#{longFormattedNumber(bob4[6][0])} (sells for #{longFormattedNumber(bob4[6][0]/5)})"
    elsif !bob4[6][1].nil?
      p="#{longFormattedNumber(bob4[6][0])} (sells for #{longFormattedNumber(bob4[6][0]/4)})"
    else
      p="#{longFormattedNumber(bob4[6][0])} (sells for #{longFormattedNumber(bob4[6][0]/2)})"
    end
    text="#{text}\n**Cost:** #{p}"
    if bob4[3].nil?
    elsif bob4[3]=='Enemy'
      text="#{text}\n**Enemy exclusive**"
    elsif bob4[3].include?('*')
      text="#{text}\n**Locked to:** #{bob4[3].gsub('*','')}"
    elsif bob4[3].length>0
      text="#{text}\n**Prf to:** #{bob4[3]}"
    end
    text="#{text}\n**Additional info:** #{bob4[7]}" if bob4[7] != '-' && !bob4[7].nil? && bob4[7] != ''
  end
  create_embed(event,fullname,text,xcolor)
end

def get_unit_list(event,bot,args)
  args=event.message.text.downcase.gsub(',','').split(' ') if args.nil?
  args=args.map{|q| q.gsub(',','')}.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  generations=[]
  genders=[]
  games=[]
  games2=[]
  games2x=[]
  games3=[]
  games3x=[]
  blood=[]
  for i in 0...args.length
    generations.push("1") if ['1','1st','1stgen','1st-gen','1st_gen','gen1','gen-1','gen_1','firstgen','first-gen','first_gen'].include?(args[i].downcase)
    generations.push("2") if ['2','2nd','2ndgen','2nd-gen','2nd_gen','gen2','gen-2','gen_2','secondgen','second-gen','second_gen'].include?(args[i].downcase)
    generations.push("3") if ['3','3rd','3rdgen','3rd-gen','2nd_gen','gen3','gen-3','gen_3','thirdgen','third-gen','third_gen'].include?(args[i].downcase)
    genders.push('m') if ['male','man','boy'].include?(args[i].downcase)
    genders.push('f') if ['female','woman','girl'].include?(args[i].downcase)
    genders.push('c') if ['avatar'].include?(args[i].downcase)
    games.push("A") if ['FE13', 'Awakening', 'FEA', 'FE:A'].map{|q| q.downcase}.include?(args[i].downcase)
    games.push("F") if ['FE14', 'if', 'FEif', 'FE:if', 'FE:f', 'FEf', 'Fates'].map{|q| q.downcase}.include?(args[i].downcase)
    games.push("T") if ['FE16', 'ThreeHouses', 'Three', 'Houses', 'House', '3H'].map{|q| q.downcase}.include?(args[i].downcase)
    games2.push("b") if ['FE14b', 'Birthright', 'Hoshido', 'FE14r', 'Revelation', 'Revelations'].map{|q| q.downcase}.include?(args[i].downcase)
    games2x.push("Birthright") if ['FE14b', 'Birthright', 'Hoshido'].map{|q| q.downcase}.include?(args[i].downcase)
    games2.push("B") if ['FE14b', 'Birthright', 'Hoshido'].map{|q| q.downcase}.include?(args[i].downcase)
    games2.push("c") if ['FE14c', 'Conquest', 'Nohr', 'FE14r', 'Revelation', 'Revelations'].map{|q| q.downcase}.include?(args[i].downcase)
    games2.push("C") if ['FE14c', 'Conquest', 'Nohr'].map{|q| q.downcase}.include?(args[i].downcase)
    games2x.push("Conquest") if ['FE14c', 'Conquest', 'Nohr'].map{|q| q.downcase}.include?(args[i].downcase)
    games2.push("r") if ['FE14r', 'Revelation', 'Revelations', 'FE14b', 'Birthright', 'Hoshido', 'FE14c', 'Conquest', 'Nohr'].map{|q| q.downcase}.include?(args[i].downcase)
    games2.push("e") if ['FE14b', 'Birthright', 'Hoshido', 'FE14c', 'Conquest', 'Nohr'].map{|q| q.downcase}.include?(args[i].downcase)
    games2.push("R") if ['FE14r', 'Revelation', 'Revelations'].map{|q| q.downcase}.include?(args[i].downcase)
    games2x.push("Revelations") if ['FE14r', 'Revelation', 'Revelations'].map{|q| q.downcase}.include?(args[i].downcase)
    games2.push("g") if ['FE14g', 'Gates', 'Penumbra'].map{|q| q.downcase}.include?(args[i].downcase)
    games2x.push("Gates") if ['FE14g', 'Gates', 'Penumbra'].map{|q| q.downcase}.include?(args[i].downcase) && !event.server.nil? && event.server.id==256291408598663168
  end
  games.push('F') if games.length<=0 && games2.length>0
  games.push(game[0,1]) if games.length<=0 && game.length>0
  games.uniq!
  games2.uniq!
  games2x.uniq!
  games3.uniq!
  games3x.uniq!
  generations.uniq!
  genders.uniq!
  blood.uniq!
  data_load()
  untz=@units.map{|q| q}
  untz=@units.reject{|q| q[1][3]=='g'} if event.server.nil? || event.server.id != 256291408598663168
  m=untz.map{|q| q}
  untz=[]
  for i in 0...m.length
    m[i][0]=m[i][0].split(' ')[0] if m[i][1][2]=='T' && m[i][0]!='Ferdinand von Aegir'
    m[i][0]="#{m[i][0]} *[Amiibo]*" if m[i][2].downcase.include?('amiibo')
    m[i][0]="#{m[i][0]} *[Capturable]*" if m[i][2].downcase.include?('capturable')
    untz.push(m[i])
  end
  if generations.length>0
    m=untz.map{|q| q}
    untz=[]
    for i in 0...m.length
      if generations.include?(m[i][1][0,1])
        untz.push(m[i])
      elsif m[i][1][0,1]=='3' && generations.include?('2')
        m[i][0]="#{m[i][0]} *[generation varies]*"
        untz.push(m[i])
      end
    end
  end
  if genders.length>0
    m=untz.map{|q| q}
    untz=[]
    for i in 0...m.length
      if genders.include?(m[i][1][1,1])
        untz.push(m[i])
      elsif genders.include?('m') && genders.include?('f')
      elsif m[i][1][1,1]=='c'
        m[i][0]="#{m[i][0]} *[gender varies]*"
        untz.push(m[i])
      end
    end
  end
  for i in 0...untz.length
    untz[i][0]=untz[i][0].gsub(' *[generation varies]* *[gender varies]*',' *[varies]*')
    untz[i][0]="*Awakening*!#{untz[i][0]}" if untz[i][0]=='Anna' && untz[i][1][2,1]=='A' && games.length != 1
    untz[i][0]="*Fates*!#{untz[i][0]}" if untz[i][0]=='Anna' && untz[i][1][2,1]=='F' && games.length != 1
    untz[i][0]="*3H*!#{untz[i][0]}" if untz[i][0]=='Anna' && untz[i][1][2,1]=='T' && games.length != 1
  end
  untz=untz.reject{|q| !games.include?(q[1][2,1])} if games.length>0
  untz=untz.reject{|q| q[1][2,1]=='F' && !games2.include?(q[1][3,1])} if games2.length>0
  untz=untz.reject{|q| q[1][2,1]=='T' && !games3.include?(q[1][3,1])} if games3.length>0
  untz=untz.reject{|q| !blood.include?(q[1][4,1])} if blood.length>0
  untz=untz.sort{|a,b| a[0]<=>b[0]}
  dispstr=[]
  dispstr.push("*Games:* #{'Awakening' if games.include?('A')}#{', ' if games.length>1}#{"Fates#{" (#{games2x.join(', ')})" if games2x.length>0}" if games.include?('F')}#{', ' if games.include?('F') && games.include?('T')}#{"Three Houses#{" (#{games3x.join(', ')})" if games3x.length>0}" if games.include?('T')}") if games.length>0
  dispstr.push("*Generations:* #{generations.map{|q| ['','1st Gen','2nd Gen','3rd Gen'][q.to_i]}.join(', ')}") if generations.length>0
  for i in 0...genders.length
    genders[i]='Male' if genders[i]=='m'
    genders[i]='Female' if genders[i]=='f'
    genders[i]='Avatar or kid' if genders[i]=='c'
  end
  dispstr.push("*Genders:* #{genders.join(', ')}") if genders.length>0
  dispstr.push("*Holy Powers:* #{blood.join(', ')}") if blood.length>0
  xcolor=0x02010a
  xcolor=0x061069 if games.length==1 && games[0]=='A'
  if games.length==1 && games[0]=='F'
    xcolor=0xC5EEF2
    xcolor=0xBC4372 if games2x.length>0 && !games2x.include?('Revelations') && !games2x.include?('Gates')
    xcolor=0x2DA5AF if games2x.length==1 && games2x[0]=='Revelations'
    xcolor=0xCF000D if games2x.length==1 && games2x[0]=='Birthright'
    xcolor=0xAA7FCD if games2x.length==1 && games2x[0]=='Conquest'
    xcolor=0xFFEA8B if games2x.length==1 && games2x[0]=='Gates'
  elsif games.length==1 && games[0]=='T'
    xcolor=0x2D6864
    xcolor=0x7D171F if games3x.length==1 && games3x[0]=='Black Eagles'
    xcolor=0x4B4E9B if games3x.length==1 && games3x[0]=='Blue Lions'
    xcolor=0x897A04 if games3x.length==1 && games3x[0]=='Golden Deer'
    xcolor=0x8A8D94 if games3x.length==1 && games3x[0]=='Ashen Wolves'
    xcolor=0x565562 if games3x.length==1 && games3x[0]=='x'
  end
  flds=nil
  if untz.map{|q| q[1][2,1]}.uniq.length>1
    flds=[]
    flds.push(['*Awakening*',untz.reject{|q| q[1][2,1]!='A'}.map{|q| q[0]}.uniq.join("\n")])
    flds.push(['*Fates*',untz.reject{|q| q[1][2,1]!='F'}.map{|q| q[0]}.uniq.join("\n")])
    flds.push(['*Three Houses*',untz.reject{|q| q[1][2,1]!='T'}.map{|q| q[0]}.uniq.join("\n")])
  elsif untz.map{|q| q[1][2,1]}.uniq.length<=1 && untz.map{|q| q[1][2,1]}[0]=='F' && untz.map{|q| q[1][3,1]}.uniq.length>1 && games2x.length != 1
    flds=[]
    flds.push(['*Birthright*',untz.reject{|q| !['b','B','r','e'].include?(q[1][3,1])}.map{|q| "#{q[0]}#{' *[exclusive]*' if ['B','e'].include?(q[1][3,1])}"}.uniq.join("\n")])
    flds.push(['*Conquest*',untz.reject{|q| !['c','C','r','e'].include?(q[1][3,1])}.map{|q| "#{q[0]}#{' *[exclusive]*' if ['C','e'].include?(q[1][3,1])}"}.uniq.join("\n")])
    flds.push(['*Revelations*-exclusive',untz.reject{|q| !['R'].include?(q[1][3,1])}.map{|q| q[0]}.uniq.join("\n")])
  elsif untz.map{|q| q[1][2,1]}.uniq.length<=1 && untz.map{|q| q[1][2,1]}[0]=='T' && untz.map{|q| q[1][3,1]}.uniq.length>1 && games2x.length != 1
    flds=[]
    flds2=[]
    flds.push(['Black Eagles',untz.reject{|q| !['r','R','x'].include?(q[1][3,1])}.map{|q| "#{q[0]}#{' *[exclusive]*' if ['R'].include?(q[1][3,1])}"}.uniq.join("\n")])
    flds.push(['Blue Lions',untz.reject{|q| !['b','B','x'].include?(q[1][3,1])}.map{|q| "#{q[0]}#{' *[exclusive]*' if ['B'].include?(q[1][3,1])}"}.uniq.join("\n")])
    flds.push(['Golden Deer',untz.reject{|q| !['y','Y','x'].include?(q[1][3,1])}.map{|q| "#{q[0]}#{' *[exclusive]*' if ['Y'].include?(q[1][3,1])}"}.uniq.join("\n")])
    flds.push(['Ashen Wolves',untz.reject{|q| !['a','A','x'].include?(q[1][3,1])}.map{|q| "#{q[0]}#{' *[exclusive]*' if ['A'].include?(q[1][3,1])}"}.uniq.join("\n")])
    flds2.push(['Church of Seiros',untz.reject{|q| !['c','C'].include?(q[1][3,1])}.map{|q| "#{q[0]}#{' *[exclusive]*' if ['C'].include?(q[1][3,1])}"}.uniq.join("\n")])
    flds2.push(['Knights of Seiros',untz.reject{|q| !['k','K'].include?(q[1][3,1])}.map{|q| "#{q[0]}#{' *[exclusive]*' if ['K'].include?(q[1][3,1])}"}.uniq.join("\n")])
    flds2.push(['---',untz.reject{|q| !['X'].include?(q[1][3,1])}.map{|q| q[0]}.uniq.join("\n")])
    flds.push(['Miscellaneous',flds2.reject{|q| q[1].length<=0}.map{|q| "__**#{q[0]}**__\n#{q[1]}"}.join("\n\n")])
  else
    flds=triple_finish(untz.map{|q| q[0]}.uniq) unless untz.length<=0
  end
  flds=flds.reject{|q| q[1].length<=0}
  create_embed(event,"#{"__**Search**__\n#{dispstr.join("\n")}\n\n" if dispstr.length>0}__**Results**__",'',xcolor,"#{untz.map{|q| q[0]}.uniq.length} total",nil,flds)
end

def spaceship_order(x)
  return 1 if x=='Unit'
  return 2 if x=='Class'
  return 3 if x=='Skill'
  return 4 if x=='Item'
  return 500
end

def add_new_alias(bot,event,newname=nil,unit=nil,modifier=nil,modifier2=nil,mode=0)
  game=game_proc(event)
  game="Fates" if game.length<=0
  nicknames_load()
  err=false
  str=''
  if newname.nil? || unit.nil?
    str="The alias system can cover:\n- Units\n- Classes\n- Skills\n- Weapons/Items\n\nYou must specify both:\n- one of the above\n- an alias you wish to give that item"
    err=true
  elsif event.user.id != 167657750971547648 && event.server.nil?
    str="Only my developer is allowed to use this command in PM."
    err=true
  elsif !is_mod?(event.user,event.server,event.channel)
    str="You are not a mod."
    err=true
  elsif newname.include?('"') || newname.include?("\n")
    str="Full stop.  \" is not allowed in an alias."
    err=true
  end
  if err
    event.respond str if str.length>0 && mode==0
    args=event.message.text.downcase.split(' ')
    args.shift
    disp_aliases(bot,event,args) if mode==1
    return nil
  end
  newname=newname.gsub('!','').gsub('(','').gsub(')','').gsub('_','')
  type=['Alias','Alias']
  if !find_unit(game,newname,event,true).nil?
    type[0]='Unit'
  elsif !find_class(newname,event,game,true).nil?
    type[0]='Class'
  elsif !find_skill(game,newname,event,true).nil?
    type[0]='Skill'
  elsif !find_item(game,newname,event,true).nil?
    type[0]='Item'
  elsif !find_unit(game,newname,event).nil?
    type[0]='Unit*'
  elsif !find_class(newname,event,game).nil?
    type[0]='Class*'
  elsif !find_skill(game,newname,event).nil?
    type[0]='Skill*'
  elsif !find_item(game,newname,event).nil?
    type[0]='Item*'
  end
  if !find_unit(game,unit,event,true).nil?
    type[1]='Unit'
  elsif !find_class(unit,event,game,true).nil?
    type[1]='Class'
  elsif !find_skill(game,unit,event,true).nil?
    type[1]='Skill'
  elsif !find_item(game,unit,event,true).nil?
    type[1]='Item'
  elsif !find_unit(game,unit,event).nil?
    type[1]='Unit*'
  elsif !find_class(unit,event,game).nil?
    type[1]='Class*'
  elsif !find_skill(game,unit,event).nil?
    type[1]='Skill*'
  elsif !find_item(game,unit,event).nil?
    type[1]='Item*'
  end
  cck=nil
  checkstr=normalize(newname,true)
  if type.reject{|q| q != 'Alias'}.length<=0
    type[0]='Alias' if type[0].include?('*')
    type[1]='Alias' if type[1].include?('*') && type[0]!='Alias'
  end
  if type.reject{|q| q == 'Alias'}.length<=0
    alz1=newname
    alz2=unit
    alz1='>Censored mention<' if alz1.include?('@')
    alz2='>Censored mention<' if alz2.include?('@')
    str="The alias system can cover:\n- Units\n- Classes\n- Skills\n- Items and Weapons\n\nNeither #{alz1} nor #{alz2} fall into any of these categories."
    err=true
  elsif type.reject{|q| q != 'Alias'}.length<=0
    alz1=newname
    alz2=unit
    alz1='>Censored mention<' if alz1.include?('@')
    alz2='>Censored mention<' if alz2.include?('@')
    str="#{alz1} is a #{type[0].downcase}\n#{alz2} is a #{type[1].downcase}\nPlease try again."
    err=true
  end
  if err
    str=["#{str}\nPlease try again.","#{str}\nTrying to list aliases instead."][mode]
    event.respond str if str.length>0
    args=event.message.text.downcase.split(' ')
    args.shift
    list_unit_aliases(event,args,bot) if mode==1
    return nil
  end
  if type[1]=='Alias' && type[0]!='Alias'
    f="#{newname}"
    newname="#{unit}"
    unit="#{f}"
    type=type.reverse.map{|q| q.gsub('*','')}
  else
    type=type.map{|q| q.gsub('*','')}
  end
  logchn=386658080257212417
  logchn=431862993194582036 if @shardizard==4
  srv=0
  srv=event.server.id unless event.server.nil?
  srv=modifier.to_i if event.user.id==167657750971547648 && modifier.to_i.to_s==modifier
  srvname="PM with dev"
  srvname=bot.server(srv).name unless event.server.nil? && srv==0
  checkstr=normalize(newname,true) unless newname.nil?
  k=event.message.emoji
  for i in 0...k.length
    checkstr=checkstr.gsub("<:#{k[i].name}:#{k[i].id}>",k[i].name)
  end
  if checkstr.downcase =~ /(7|t)+?h+?(o|0)+?(7|t)+?/
    event.respond "That name has __***NOT***__ been added to #{find_unit(game,unit,event)[0]}'s aliases."
    bot.channel(logchn).send_message("~~**Server:** #{srvname} (#{srv})\n**Channel:** #{event.channel.name} (#{event.channel.id})\n**User:** #{event.user.distinct} (#{event.user.id})\n**Alias:** #{newname} for #{unit}~~\n**Reason for rejection:** Begone, alias.")
    return nil
  elsif checkstr.downcase =~ /n+?(i|1)+?(b|g|8)+?(a|4|(e|3)+?r+?)+?/
    event.respond "That name has __***NOT***__ been added to #{find_unit(game,unit,event)[0]}'s aliases."
    bot.channel(logchn).send_message("~~**Server:** #{srvname} (#{srv})\n**Channel:** #{event.channel.name} (#{event.channel.id})\n**User:** #{event.user.distinct} (#{event.user.id})\n**Alias:** >Censored< for #{unit}~~\n**Reason for rejection:** Begone, alias.")
    return nil
  end
  newname=normalize(newname,true)
  m=nil
  m=[event.server.id] unless event.server.nil?
  srv=0
  srv=event.server.id unless event.server.nil?
  srv=modifier.to_i if event.user.id==167657750971547648 && modifier.to_i.to_s==modifier
  srvname="PM with dev"
  srvname=bot.server(srv).name unless event.server.nil? && srv==0
  if event.user.id==167657750971547648 && modifier.to_i.to_s==modifier
    m=[modifier.to_i]
    modifier=nil
  end
  chn=event.channel.id
  chn=modifier2.to_i if event.user.id==167657750971547648 && !modifier2.nil? && modifier2.to_i.to_s==modifier2
  m=nil if event.user.id==167657750971547648 && !modifier.nil?
  if type[1]=='Unit'
    unit=find_unit(game,unit,event)[0]
    unit=unit.gsub('3H!Anna','Anna').gsub('Fates!Anna','Anna').gsub('Awakening!Anna','Anna')
  elsif type[1]=='Class'
    unit=find_class(unit,event,game)[0]
  elsif type[1]=='Skill'
    unit=find_skill(game,unit,event)[0]
  elsif type[1]=='Item'
    unit=find_item(game,unit,event)[0]
  end
  double=false
  for i in 0...@names.length
    if @names[i][3].nil?
    elsif @names[i][1].downcase==newname.downcase && @names[i][2].downcase==unit.downcase
      if event.user.id==167657750971547648 && !modifier.nil?
        @names[i][3]=nil
        @names[i].compact!
        bot.channel(chn).send_message("The alias **#{newname}** for the #{type[1].downcase} *#{unit}* exists in a server already.  Making it global now.")
        event.respond "The alias **#{newname}** for the #{type[1].downcase} *#{unit}* exists in a server already.  Making it global now.\nPlease test to be sure that the alias stuck." if event.user.id==167657750971547648 && !modifier2.nil? && modifier2.to_i.to_s==modifier2
        bot.channel(logchn).send_message("**Server:** #{srvname} (#{srv})\n**Channel:** #{event.channel.name} (#{event.channel.id})\n**User:** #{event.user.distinct} (#{event.user.id})\n**#{type[1]} Alias:** #{newname} for #{unit} - gone global.")
        double=true
      else
        @names[i][3].push(srv)
        bot.channel(chn).send_message("The alias **#{newname}** for the #{type[1].downcase} *#{unit}* exists in another server already.  Adding this server to those that can use it.")
        event.respond "The alias **#{newname}** for the #{type[1].downcase} *#{unit}* exists in another server already.  Adding this server to those that can use it.\nPlease test to be sure that the alias stuck." if event.user.id==167657750971547648 && !modifier2.nil? && modifier2.to_i.to_s==modifier2
        metadata_load()
        bot.user(167657750971547648).pm("The alias **#{@names[i][0]}** for the character **#{@names[i][1]}** is used in quite a few servers.  It might be time to make this global") if @names[i][3].length >= @server_data2[0].inject(0){|sum,x| sum + x } / 20 && @names[i][4].nil?
        bot.channel(logchn).send_message("**Server:** #{srvname} (#{srv})\n**Channel:** #{event.channel.name} (#{event.channel.id})\n**User:** #{event.user.distinct} (#{event.user.id})\n**#{type[1]} Alias:** #{newname} for #{unit} - gained a new server that supports it.")
        double=true
      end
    end
  end
  unless double
    @names.push([type[1],newname,unit,m].compact)
    @names.sort! {|a,b| (spaceship_order(a[0]) <=> spaceship_order(b[0])) == 0 ? ((a[2].downcase <=> b[2].downcase) == 0 ? (a[1].downcase <=> b[1].downcase) : (a[2].downcase <=> b[2].downcase)) : (spaceship_order(a[0]) <=> spaceship_order(b[0]))}
    bot.channel(chn).send_message("**#{newname}** has been#{" globally" if event.user.id==167657750971547648 && !modifier.nil?} added to the aliases for the #{type[1].downcase} *#{unit}*.\nPlease test to be sure that the alias stuck.")
    event.respond "**#{newname}** has been#{" globally" if event.user.id==167657750971547648 && !modifier.nil?} added to the aliases for the #{type[1].downcase} *#{unit}*." if event.user.id==167657750971547648 && !modifier2.nil? && modifier2.to_i.to_s==modifier2
    bot.channel(logchn).send_message("**Server:** #{srvname} (#{srv})\n**Channel:** #{event.channel.name} (#{event.channel.id})\n**User:** #{event.user.distinct} (#{event.user.id})\n**#{type[1]} Alias:** #{newname} for #{unit}")
  end
  @names.uniq!
  nzzz=@names.map{|a| a}
  open("C:/Users/#{@mash}/Desktop/devkit/FENames.txt", 'w') { |f|
    for i in 0...nzzz.length
      f.puts "#{nzzz[i].to_s}#{"\n" if i<nzzz.length-1}"
    end
  }
  nicknames_load()
  nzzz=@names.reject{|q| q[0]!='Unit'}
  nzzz2=@names.reject{|q| q[0]!='Class'}
  nzzz3=@names.reject{|q| q[0]!='Skill'}
  nzzz4=@names.reject{|q| q[0]!='Item'}
  if nzzz[nzzz.length-1].length>1 && nzzz[nzzz.length-1][2]>="Xander" && nzzz2[nzzz2.length-1].length>1 && nzzz2[nzzz2.length-1][2]>="Wyvern Rider" && nzzz3[nzzz3.length-1].length>1 && nzzz3[nzzz3.length-1][2]>="Defensetaker" && nzzz4[nzzz4.length-1].length>1 && nzzz4[nzzz4.length-1][2]>="Armorslayer"
    bot.channel(logchn).send_message("Alias list saved.")
    open("C:/Users/#{@mash}/Desktop/devkit/FENames2.txt", 'w') { |f|
      for i in 0...nzzz.length
        f.puts "#{nzzz[i].to_s}#{"\n" if i<nzzz.length-1}"
      end
      for i in 0...nzzz2.length
        f.puts "#{nzzz2[i].to_s}#{"\n" if i<nzzz2.length-1}"
      end
      for i in 0...nzzz3.length
        f.puts "#{nzzz3[i].to_s}#{"\n" if i<nzzz3.length-1}"
      end
      for i in 0...nzzz4.length
        f.puts "#{nzzz4[i].to_s}#{"\n" if i<nzzz4.length-1}"
      end
    }
    bot.channel(logchn).send_message("Alias list has been backed up.")
  end
end

def disp_aliases(bot,event,args=nil,mode=0)
  game=game_proc(event)
  game="Fates" if game.length<=0
  event.channel.send_temporary_message("Calculating data, please wait...",2)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  nicknames_load()
  unless args.length==0
    unit=find_unit(game,args.join(''),event)
    clzz=find_class(args.join(''),event,game)
    skll=find_skill(game,args.join(''),event)
    itmu=find_item(game,args.join(''),event)
    if unit.nil? && clzz.nil? && skll.nil? && itmu.nil? && !has_any?(['unit','units','characters','character','chara','charas','char','chars','class','classes','job','jobs','skill','skills','skil','skils','item','items','weapon','weapons'],args)
      alz1=args.join(' ')
      alz1='>Censored mention<' if alz1.include?('@')
      event.respond "The alias system can cover:\n- Units\n- Classes\n- Skills\n- Items/Weapons\n\n#{alz1} does not fall into any of these categories."
      return nil
    end
  end
  unless unit.nil? || unit.is_a?(Array)
    unit=nil if find_unit(game,unit,event).nil?
  end
  unless clzz.nil? || clzz.is_a?(Array)
    clzz=nil if find_class(clzz,event,game).nil?
  end
  unless skll.nil? || skll.is_a?(Array)
    skll=nil if find_skill(game,skll,event).nil?
  end
  unless itmu.nil? || itmu.is_a?(Array)
    itmu=nil if find_item(game,itmu,event).nil?
  end
  f=[]
  n=@names.reject{|q| q[0]!='Unit'}.map{|a| [a[1],a[2],a[3]]}
  if unit.nil? && clzz.nil? && skll.nil? && itmu.nil?
    if has_any?(['unit','units','characters','character','chara','charas','char','chars'],args)
      n=n.reject{|q| q[2].nil?} if mode==1
      n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
      f.push('__**Unit aliases**__')
      for i in 0...n.length
        if n[i][2].nil? || (mode==1 && !event.server.nil?)
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')}")
        elsif mode==1 && !event.server.nil?
        else
          a=[]
          for j in 0...n[i][2].length
            srv=(bot.server(n[i][2][j]) rescue nil)
            unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
              a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
            end
          end
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
        end
      end
    elsif has_any?(['class','classes','job','jobs'],args)
      f.push('__**Class aliases**__')
      n=@names.reject{|q| q[0]!='Class'}.map{|a| [a[1],a[2],a[3]]}
      n=n.reject{|q| q[2].nil?} if mode==1
      n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
      for i in 0...n.length
        if n[i][2].nil? || (mode==1 && !event.server.nil?)
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')}")
        elsif mode==1 && !event.server.nil?
        else
          a=[]
          for j in 0...n[i][2].length
            srv=(bot.server(n[i][2][j]) rescue nil)
            unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
              a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
            end
          end
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
        end
      end
    elsif has_any?(['skill','skills','skil','skils'],args)
      f.push('__**Skill aliases**__')
      n=@names.reject{|q| q[0]!='Skill'}.map{|a| [a[1],a[2],a[3]]}
      n=n.reject{|q| q[2].nil?} if mode==1
      n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
      for i in 0...n.length
        if n[i][2].nil?
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')}")
        elsif mode==1 && !event.server.nil?
        else
          a=[]
          for j in 0...n[i][2].length
            srv=(bot.server(n[i][2][j]) rescue nil)
            unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
              a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
            end
          end
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
        end
      end
    elsif has_any?(['item','items','weapon','weapons'],args)
      f.push('__**Item/Weapon aliases**__')
      n=@names.reject{|q| q[0]!='Item'}.map{|a| [a[1],a[2],a[3]]}
      n=n.reject{|q| q[2].nil?} if mode==1
      n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
      for i in 0...n.length
        if n[i][2].nil?
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')}")
        elsif mode==1 && !event.server.nil?
        else
          a=[]
          for j in 0...n[i][2].length
            srv=(bot.server(n[i][2][j]) rescue nil)
            unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
              a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
            end
          end
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
        end
      end
    elsif safe_to_spam?(event) || mode==1
      n=n.reject{|q| q[2].nil?} if mode==1
      n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
      f.push('__**Unit aliases**__')
      for i in 0...n.length
        if n[i][2].nil? || (mode==1 && !event.server.nil?)
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')}")
        elsif mode==1 && !event.server.nil?
        else
          a=[]
          for j in 0...n[i][2].length
            srv=(bot.server(n[i][2][j]) rescue nil)
            unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
              a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
            end
          end
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
        end
      end
      f.push("\n__**Class aliases**__")
      n=@names.reject{|q| q[0]!='Class'}.map{|a| [a[1],a[2],a[3]]}
      n=n.reject{|q| q[2].nil?} if mode==1
      n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
      for i in 0...n.length
        if n[i][2].nil?
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')}")
        elsif mode==1 && !event.server.nil?
        else
          a=[]
          for j in 0...n[i][2].length
            srv=(bot.server(n[i][2][j]) rescue nil)
            unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
              a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
            end
          end
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
        end
      end
      f.push("\n__**Skill aliases**__")
      n=@names.reject{|q| q[0]!='Skill'}.map{|a| [a[1],a[2],a[3]]}
      n=n.reject{|q| q[2].nil?} if mode==1
      n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
      for i in 0...n.length
        if n[i][2].nil?
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')}")
        elsif mode==1 && !event.server.nil?
        else
          a=[]
          for j in 0...n[i][2].length
            srv=(bot.server(n[i][2][j]) rescue nil)
            unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
              a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
            end
          end
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
        end
      end
      f.push("\n__**Item/Weapon aliases**__")
      n=@names.reject{|q| q[0]!='Item'}.map{|a| [a[1],a[2],a[3]]}
      n=n.reject{|q| q[2].nil?} if mode==1
      n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
      for i in 0...n.length
        if n[i][2].nil?
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')}")
        elsif mode==1 && !event.server.nil?
        else
          a=[]
          for j in 0...n[i][2].length
            srv=(bot.server(n[i][2][j]) rescue nil)
            unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
              a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
            end
          end
          f.push("#{n[i][0].gsub('_','\_')} = #{n[i][1].gsub('_','\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
        end
      end
    else
      event.respond "Please either specify a unit name or use this command in PM."
      return nil
    end
  elsif !unit.nil?
    k=0
    k=event.server.id unless event.server.nil?
    unit=[unit] unless unit[0].is_a?(Array)
    n=n.reject{|q| q[2].nil?} if mode==1
    n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
    for i1 in 0...unit.length
      uu=find_unit(game,unit[i1][0],event)
      u=uu[0]
      f.push("__**#{u.gsub('_','\\_')}**#{"'s server-specific aliases" if mode==1}__")
      f.push(u.gsub('_','\\_').gsub('(','').gsub(')','')) if u.include?('(') || u.include?(')')
      f.push(u.split(' ')[0]) if u.split(' ').length>1 && uu[1][2]=='T'
      for i in 0...n.length
        p=""
        n2=n[i][1]
        if n[i][1].include?('!')
          p=n[i][1].split('!')
          n2=p[1]
          p=" (with automatic #{p[0]} parentage)"
        end
        if n2.downcase==u.downcase
          if event.server.nil? && !n[i][2].nil?
            a=[]
            for j in 0...n[i][2].length
              srv=(bot.server(n[i][2][j]) rescue nil)
              unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
                a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
              end
            end
            f.push("#{n[i][0].gsub('_','\\_')}#{p} (in the following servers: #{list_lift(a,"and")})") if a.length>0
          elsif n[i][2].nil? || mode==1
            f.push("#{n[i][0].gsub('_','\\_')}#{p}")
          else
            f.push("#{n[i][0].gsub('_','\\_')}#{p} (in this server only)") if n[i][2].include?(k)
          end
        end
      end
      f.push("")
    end
  elsif !clzz.nil?
    k=0
    k=event.server.id unless event.server.nil?
    unit=[clzz] unless clzz[0].is_a?(Array)
    n=@names.reject{|q| q[0]!='Class'}.map{|a| [a[1],a[2],a[3]]}
    n=n.reject{|q| q[2].nil?} if mode==1
    n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
    for i1 in 0...unit.length
      u=find_class(unit[i1][0],event,game)[0]
      f.push("__**#{u.gsub('_','\\_')}**#{"'s server-specific aliases" if mode==1}__")
      f.push(u.gsub('_','\\_').gsub('(','').gsub(')','')) if u.include?('(') || u.include?(')')
      for i in 0...n.length
        if n[i][1].downcase==u.downcase
          if event.server.nil? && !n[i][2].nil?
            a=[]
            for j in 0...n[i][2].length
              srv=(bot.server(n[i][2][j]) rescue nil)
              unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
                a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
              end
            end
            f.push("#{n[i][0].gsub('_','\\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
          elsif n[i][2].nil? || mode==1
            f.push("#{n[i][0].gsub('_','\\_')}")
          else
            f.push("#{n[i][0].gsub('_','\\_')} (in this server only)") if n[i][2].include?(k)
          end
        end
      end
      f.push("")
    end
  elsif !skll.nil?
    k=0
    k=event.server.id unless event.server.nil?
    unit=[skll] unless skll[0].is_a?(Array)
    n=@names.reject{|q| q[0]!='Skill'}.map{|a| [a[1],a[2],a[3]]}
    n=n.reject{|q| q[2].nil?} if mode==1
    n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
    for i1 in 0...unit.length
      u=find_skill(game,unit[i1][0],event)[0]
      f.push("__**#{u.gsub('_','\\_')}**#{"'s server-specific aliases" if mode==1}__")
      f.push(u.gsub('_','\\_').gsub('(','').gsub(')','')) if u.include?('(') || u.include?(')')
      for i in 0...n.length
        if n[i][1].downcase==u.downcase
          if event.server.nil? && !n[i][2].nil?
            a=[]
            for j in 0...n[i][2].length
              srv=(bot.server(n[i][2][j]) rescue nil)
              unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
                a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
              end
            end
            f.push("#{n[i][0].gsub('_','\\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
          elsif n[i][2].nil? || mode==1
            f.push("#{n[i][0].gsub('_','\\_')}")
          else
            f.push("#{n[i][0].gsub('_','\\_')} (in this server only)") if n[i][2].include?(k)
          end
        end
      end
      f.push("")
    end
  elsif !itmu.nil?
    k=0
    k=event.server.id unless event.server.nil?
    unit=[itmu] unless itmu[0].is_a?(Array)
    n=@names.reject{|q| q[0]!='Item'}.map{|a| [a[1],a[2],a[3]]}
    n=n.reject{|q| q[2].nil?} if mode==1
    n=n.reject{|q| !q[2].include?(event.server.id)} if mode==1 && !event.server.nil?
    for i1 in 0...unit.length
      u=find_item(game,unit[i1][0],event)[0]
      f.push("__**#{u.gsub('_','\\_')}**#{"'s server-specific aliases" if mode==1}__")
      f.push(u.gsub('_','\\_').gsub('(','').gsub(')','')) if u.include?('(') || u.include?(')')
      for i in 0...n.length
        if n[i][1].downcase==u.downcase
          if event.server.nil? && !n[i][2].nil?
            a=[]
            for j in 0...n[i][2].length
              srv=(bot.server(n[i][2][j]) rescue nil)
              unless srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
                a.push("*#{bot.server(n[i][2][j]).name}*") unless event.user.on(n[i][2][j]).nil?
              end
            end
            f.push("#{n[i][0].gsub('_','\\_')} (in the following servers: #{list_lift(a,"and")})") if a.length>0
          elsif n[i][2].nil? || mode==1
            f.push("#{n[i][0].gsub('_','\\_')}")
          else
            f.push("#{n[i][0].gsub('_','\\_')} (in this server only)") if n[i][2].include?(k)
          end
        end
      end
      f.push("")
    end
  end
  f.uniq!
  if f.length>50 && !safe_to_spam?(event)
    event.respond "There are so many aliases that I don't want to spam the server.  Please use the command in PM."
    return nil
  end
  msg=''
  for i in 0...f.length
    msg=extend_message(msg,f[i],event)
  end
  event.respond msg
  return nil
end

def bday_order(bot,event=nil,mode=0)
  data_load()
  untz=@units.map{|q| q}
  untz=@units.reject{|q| q[1][3]=='g'} if event.nil? || event.server.nil? || event.server.id != 256291408598663168
  untz=untz.reject{|q| q[8].nil? || q[8].length<=1}
  t=Time.now
  for i in 0...untz.length
    if untz[i][1][3]=='g'
      untz[i][1]='Gates'
    elsif untz[i][1][2]=='F'
      untz[i][1]='Fates'
    elsif untz[i][1][2]=='A'
      untz[i][1]='Awakening'
    elsif untz[i][1][2]=='T'
      untz[i][1]='Three Houses'
    else
      untz[i][1]='Unknown'
    end
    untz[i][0]="*#{untz[i][1]}*!Anna" if mode==1 && untz[i][0]=='Anna'
    untz[i][0]="*3H*!Anna" if untz[i][0]=="*Three Houses*!Anna"
    untz[i][0]=untz[i][0].split(' ')[0] if untz[i][1]=='Three Houses' && untz[i][0]!='Ferdinand von Aegir'
    if untz[i][1]=='Three Houses' && untz[i][8].length>=3
      untz[i][8].push(untz[i][8][0]+839)
      untz[i][8].shift
    end
    if t.month>untz[i][8][0]
      untz[i][8].unshift(t.year+1)
    elsif t.month==untz[i][8][0] && t.day>untz[i][8][1]
      untz[i][8].unshift(t.year+1)
    else
      untz[i][8].unshift(t.year)
    end
    untz[i]=[untz[i][8][0], untz[i][8][1], untz[i][8][2], untz[i][0], untz[i][1], untz[i][8][3]]
    untz[i]=nil if untz[i][3]=='Lucina' && untz[i][4]=='Fates'
  end
  y=t.year
  y+=1 if t.month>4 || (t.month==4 && t.day>24)
  untz.push([y,4,24,'My developer','Real Life'])
  untz.compact!
  untz.sort! {|a,b| supersort(a,b,0) == 0 ? (supersort(a,b,1) == 0 ? (supersort(a,b,2) == 0 ? (supersort(a,b,3) == 0 ? supersort(a,b,4) : supersort(a,b,3)) : supersort(a,b,2)) : supersort(a,b,1)) : supersort(a,b,0)}
  return untz
end

def bday_text(event,bot,message=nil)
  untz=bday_order(bot,event)
  t=Time.now
  msg='__**Upcoming birthdays**__'
  msg=extend_message(message,msg,event,2) if !message.nil? && message.length>0
  ftz=untz.reject{|q| q[4]!='Fates'}
  gtz=untz.reject{|q| q[4]!='Gates'}
  awk=untz.reject{|q| q[4]!='Awakening'}
  thz=untz.reject{|q| q[4]!='Three Houses'}
  unk=untz.reject{|q| ['Fates','Gates','Awakening','Three Houses'].include?(q[4])}
  unk=unk.reject{|q| q[4]=='Real Life'} unless @shardizard==4 || event.user.id==167657750971547648
  unless safe_to_spam?(event)
    ftz=ftz[0,8]
    awk=awk[0,8]
    thz=thz[0,8]
    gtz=gtz[0,[gtz.length,8].min]
    unk=unk[0,[unk.length,3].min]
  end
  msg=extend_message(msg,'__*Awakening*__',event,2)
  for i in 0...awk.length
    msg=extend_message(msg,"**#{awk[i][3]}** - #{awk[i][2]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][awk[i][1]]}#{" #{awk[i][0]}" unless awk[i][0]==t.year}",event)
  end
  msg=extend_message(msg,'__*Fates*__',event,2)
  for i in 0...ftz.length
    msg=extend_message(msg,"**#{ftz[i][3]}** - #{ftz[i][2]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][ftz[i][1]]}#{" #{ftz[i][0]}" unless ftz[i][0]==t.year}",event)
  end
  if gtz.length>0
    msg=extend_message(msg,'__*Gates*__',event,2)
    for i in 0...gtz.length
      msg=extend_message(msg,"**#{gtz[i][3]}** - #{gtz[i][2]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][gtz[i][1]]}#{" #{gtz[i][0]}" unless gtz[i][0]==t.year}",event)
    end
  end
  if thz.length>0
    msg=extend_message(msg,'__*Three Houses*__',event,2)
    for i in 0...thz.length
      msg=extend_message(msg,"**#{thz[i][3]}** - #{thz[i][2]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][thz[i][1]]}#{" #{thz[i][0]}" unless thz[i][0]==t.year}#{" - will become #{thz[i][0]-thz[i][5]} years old" unless thz[i][5].nil? || thz[i][5]<=0}",event)
    end
  end
  if unk.length>0
    msg=extend_message(msg,'__Other__',event,2)
    for i in 0...unk.length
      msg=extend_message(msg,"**#{unk[i][3]}** - #{unk[i][2]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][unk[i][1]]}#{" #{unk[i][0]}" unless unk[i][0]==t.year}",event)
    end
  end
  msg=extend_message(msg,message,event,2) if !message.nil? && message.length>0 && !msg.include?(message)
  event.respond msg
  return nil
end

def get_support_list(name1,event,name2=nil)
  data_load()
  sup=@supports.reject{|q| ![q[0],q[1]].include?(name1) || q[2]=='n'}
  bygender=true
  unless name2.nil?
    f=sup.find_index{|q| [q[0],q[1]].include?(name2)}
    sup=sup[0,f+1] unless f.nil?
    if [name1,name2].include?('Byleth') && !find_support(name1,name2,event).nil? && ['M','F'].include?(find_support(name1,name2,event)[3])
      bygender=false
      g=find_support(name1,name2,event)[3]
      sup=sup.reject{|q| [q[0],q[1]].include?('Byleth') && ['M','F'].include?(q[3]) && q[3]!=g} unless homosexuality_filter?(event)
    end
  end
  for i in 0...sup.length
    if name1=='Byleth' && ['M','F'].include?(sup[i][3]) && name2.nil?
      sup[i][3]='male' if sup[i][3]=='M'
      sup[i][3]='female' if sup[i][3]=='F'
      sup[i][0]="#{sup[i][0]} (only as #{sup[i][3]})" if sup[i][1]=='Byleth'
      sup[i][1]="#{sup[i][1]} (only as #{sup[i][3]})" if sup[i][0]=='Byleth'
    elsif ['M','F'].include?(sup[i][3])
      sup[i][0]="#{sup[i][0]} (#{sup[i][3]})" if sup[i][0]=='Byleth'
      sup[i][1]="#{sup[i][1]} (#{sup[i][3]})" if sup[i][1]=='Byleth'
    end
    if sup[i][0].split(' (')[0]==name1
      sup[i]=sup[i][1]
    elsif sup[i][1].split(' (')[0]==name1
      sup[i]=sup[i][0]
    else
      sup[i]="#{sup[i][0]} x #{sup[i][1]}"
    end
  end
  sup[-1]="**#{sup[-1]}**" unless name2.nil? || sup.length<=0 || sup[-1].split(' (')[0]!=name2
  sup=['~~no supports in the way~~'] if sup.length<=0
  return sup.join("\n")
end

def marry_units(bot,event,name1=nil,name2=nil)
  data_load()
  bob1=find_unit("Three Houses",name1,event)
  bob2=find_unit("Three Houses",name2,event)
  name1=bob1[0] if bob1
  name2=bob2[0] if bob2
  name1=name1.split(' ')[0] if bob1 && bob1.length>1 && bob1[1][2,1]=='T' && name1 != 'Ferdinand von Aegir'
  name2=name2.split(' ')[0] if bob2 && bob2.length>1 && bob2[1][2,1]=='T' && name2 != 'Ferdinand von Aegir'
  if name1.nil?
    event.respond "Two names, or one name of a *Three Hoses* unit, must be included."
    return nil
  elsif bob1.nil?
    event.respond "#{name1} is not a valid unit"
    return nil
  elsif bob2.nil? && bob1.is_a?(Array) && bob1[1][2,1]=='T'
    event.respond get_support_list(name1,event)
    return nil
  elsif name2.nil?
    m='them'
    m='him' if bob1[1][2,1]=='M'
    m='her' if bob1[1][2,1]=='F'
    event.respond "Because #{name1} is not from *Three Houses*, an additional unit must be listed alongside #{m}"
    return nil
  elsif bob2.nil?
    event.respond "#{name2} is not a valid unit"
    return nil
  elsif !bob1.is_a?(Array) && !bob2.is_a?(Array)
    event.respond "Two names, or one name of a *Three Hoses* unit, must be included."
    return nil
  elsif [name1,name2].include?("Kana") || name1[name1.length-5,5]=='!Kana' || name2[name2.length-5,5]=='!Kana'
    if [name1,name2].include?("Corrin")
      event.respond "You cannot marry Kana as they are your child"
      return nil
    elsif [bob1[1][0,1],bob2[1][0,1]].include?("1")
      event.respond "#{name1} and #{name2} cannot marry as they are of different generations"
      return nil
    end
  elsif [name1,name2].include?("Morgan") || name1[name1.length-7,7]=='!Morgan' || name2[name2.length-7,7]=='!Morgan'
    if [name1,name2].include?("Robin")
      event.respond "You cannot marry Morgan as they are your child"
      return nil
    elsif [bob1[1][0,1],bob2[1][0,1]].include?("1")
      event.respond "#{name1} and #{name2} cannot marry as they are of different generations"
      return nil
    end
  elsif name1==name2
    m='them'
    m='him' if bob1[1][2,1]=='M'
    m='her' if bob1[1][2,1]=='F'
    event.respond "#{name1} cannot marry #{m}self"
    return nil
  elsif [name1,name2].include?("Corrin") || [name1,name2].include?("Robin") || [name1,name2].include?("Byleth")
  elsif bob1[1][0,1]!=bob2[1][0,1]
    event.respond "#{name1} and #{name2} cannot marry as they are of different generations"
    return nil
  elsif bob1[1][1,1]==bob2[1][1,1] && !homosexuality_filter?(event) && !(@gay_canon.include?(name1) && @gay_canon.include?(name2)) && find_support(name1,name2,event)[3]!='R'
    event.respond "#{name1} and #{name2} cannot marry as they are the same gender"
    return nil
  elsif !incest_filter?(event)
    if ["Xander","Camilla","Leo","Elise"].include?(name1) && ["Xander","Camilla","Leo","Elise"].include?(name2)
      event.respond "#{name1} and #{name2} cannot marry as they are siblings"
      return nil
    elsif ["Ryoma","Hinoka","Takumi","Sakura"].include?(name1) && ["Ryoma","Hinoka","Takumi","Sakura"].include?(name2)
      event.respond "#{name1} and #{name2} cannot marry as they are siblings"
      return nil
    elsif ["Chrom","Lissa","Emmeryn"].include?(name1) && ["Chrom","Lissa","Emmeryn"].include?(name2)
      event.respond "#{name1} and #{name2} cannot marry as they are siblings"
      return nil
    elsif [name1,name2].include?("Lucina") && [name1,name2].include?("Owain")
      event.respond "#{name1} and #{name2} cannot marry as they are cousins"
      return nil
    elsif [name1,name2].include?("Lissa") && [name1,name2].include?("Odin")
      event.respond "#{name1} and #{name2} cannot marry as they are mother and son"
      return nil
    elsif [name1,name2].include?("Laslow") && [name1,name2].include?("Olivia")
      event.respond "#{name1} and #{name2} cannot marry as they are mother and son"
      return nil
    elsif [name1,name2].include?("Selena") && [name1,name2].include?("Cordelia")
      event.respond "#{name1} and #{name2} cannot marry as they are mother and daughter"
      return nil
    elsif [name1,name2].include?("Owain") && [name1,name2].include?("Ophelia")
      event.respond "#{name1} and #{name2} cannot marry as they are father and daughter"
      return nil
    elsif [name1,name2].include?("Inigo") && [name1,name2].include?("Soleil")
      event.respond "#{name1} and #{name2} cannot marry as they are father and daughter"
      return nil
    elsif [name1,name2].include?("Seteth") && [name1,name2].include?("Flayn")
      event.respond "#{name1} and #{name2} cannot marry as they are father and daughter"
      return nil
    elsif [name1,name2].include?("Gilbert Pronislav") && [name1,name2].include?("Annette Fantine Dominic")
      event.respond "#{name1} and #{name2} cannot marry as they are father and daughter"
      return nil
    elsif [name1,name2].include?("Gilbert") && [name1,name2].include?("Annette")
      event.respond "#{name1} and #{name2} cannot marry as they are father and daughter"
      return nil
    end
  end
  game=game_proc(event)
  data_load()
  untz=@units.map{|q| q}
  bob1=untz[untz.find_index{|q| q[0]=='Robin' && q[1][2,1]=='A'}] if bob1[0]=='Robin' && game==''
  bob2=untz[untz.find_index{|q| q[0]=='Robin' && q[1][2,1]=='A'}] if bob2[0]=='Robin' && game==''
  if game=='' && name1[name1.length-5,5]=='!Anna' && bob1[1][2,1]!=bob2[1][2,1]
    bob1=untz[untz.find_index{|q| q[0]=='Anna' && q[1][2,1]==bob2[1][2,1]}]
    bob1[0]='Awakening!Anna' if bob1[1][2,1]=='A'
    bob1[0]='Fates!Anna' if bob1[1][2,1]=='F'
    bob1[0]='3H!Anna' if bob1[1][2,1]=='T'
    name1=bob1[0]
  elsif game=='' && name2[name2.length-5,5]=='!Anna' && bob1[1][2,1]!=bob2[1][2,1]
    bob2=untz[untz.find_index{|q| q[0]=='Anna' && q[1][2,1]==bob1[1][2,1]}]
    bob2[0]='Awakening!Anna' if bob2[1][2,1]=='A'
    bob2[0]='Fates!Anna' if bob2[1][2,1]=='F'
    bob2[0]='3H!Anna' if bob2[1][2,1]=='T'
    name2=bob2[0]
  end
  if bob1[0]=="GSO" && name2=="Corrin"
    event << "GSO's Partner Seal option becomes: >talent<"
    event << "Kamui's Partner Seal option becomes: #{bob1[6][0]}"
    event << "Kamui!Ocarina and the GSO!Kana twins are born"
    return nil
  elsif bob2[0]=="GSO" && name1=="Corrin"
    event << "Kamui's Partner Seal option becomes: #{bob2[6][0]}"
    event << "GSO's Partner Seal option becomes: >talent<"
    event << "The GSO!Kana twins and Kamui!Ocarina are born"
    return nil
  elsif bob1[1][2,1]=='T' && bob2[1][2,1]=='T'
    s1=get_support_list(name1,event,name2)
    s2=get_support_list(name2,event,name1)
    f=nil
    f='My developer becomes happy that someone else ships best 3H ship.' if [name1,name2].include?('Felix') && [name1,name2].include?('Annette')
    create_embed(event,"Paired-ending supports with higher priority than #{name1} x #{name2}",'',0x2D6864,f,nil,[[name1,s1],[name2,s2]])
    return nil
  end
  bob1[6].push('>talent<') if bob1[0]=='Corrin'
  bob2[6].push('>talent<') if bob2[0]=='Corrin'
  p1=0
  p2=0
  if ['A','T'].include?(bob1[1][2,1])
  elsif ["Villager",gender_adjust("Nohr Royal",bob1[1][1,1]),"Kitsune","Ailuran","Wolfskin","Astral Dragon","Taguel (F)","Taguel (M)","Manakete","Lord","Villager"].include?(gender_adjust(bob2[6][p1],bob1[1][1,1]).split(' (')[0])
    p1=1
  end
  p1+=1 if gender_adjust(bob2[6][p1],bob1[1][1,1]).split(' (')[0]==bob1[6][0].split(' (')[0]
  if ['A','T'].include?(bob2[1][2,1])
  elsif ["Villager",gender_adjust("Nohr Royal",bob2[1][1,1]),"Kitsune","Ailuran","Wolfskin","Astral Dragon","Taguel (F)","Taguel (M)","Manakete","Lord","Villager"].include?(gender_adjust(bob1[6][p1],bob2[1][1,1]).split(' (')[0])
    p2=1
  end
  p2+=1 if gender_adjust(bob1[6][p2],bob2[1][1,1]).split(' (')[0]==bob2[6][0].split(' (')[0]
  ps1=gender_adjust(bob2[6][p1],bob1[1][1,1])
  m=@classes.find_index{|q| q[0]==ps1 && q[1][0,1]==bob2[1][2,1]}
  ps1="#{ps1} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0 && @classes[m][1]!='Three Houses'
  ps2=gender_adjust(bob1[6][p2],bob2[1][1,1])
  m=@classes.find_index{|q| q[0]==ps2 && q[1][0,1]==bob1[1][2,1]}
  ps2="#{ps2} (#{@classes[m][7].join(', ')})" if !m.nil? && @classes[m][7].length>0 && @classes[m][1]!='Three Houses'
  if bob1[1][2,1]=="A" || bob1[1][2,1]=="T"
    name1=name1.split(' ')[0] unless bob1[1][2,1]=="A" || name1=='Ferdinand von Aegir'
    event << "#{name1} cannot get a Partner Seal option."
  elsif ps1.nil? || ps1=="" || ps1==" "
    event << "#{name1} is cheated out of a Partner Seal option."
  else
    event << "#{name1}'s Partner Seal option becomes: #{ps1}"
  end
  if bob2[1][2,1]=="A" || bob2[1][2,1]=="T"
    name2=name2.split(' ')[0] unless bob1[1][2,1]=="A" || name2=='Ferdinand von Aegir'
    event << "#{name2} cannot get a Partner Seal option."
  elsif ps2.nil? || ps2=="" || ps2==" "
    event << "#{name2} is cheated out of a Partner Seal option."
  else
    event << "#{name2}'s Partner Seal option becomes: #{ps2}"
  end
  if bob1[1][1]==bob2[1][1] && !homosexuality_filter?(event)
    if get_child(name1,bob2[1][1,1],event)=="Portia"
      event << "#{name2}!#{get_child(name1,bob2[1][1,1],event)} is built"
    elsif get_child(name2,bob1[1][1,1],event)=="Portia"
      event << "#{name1}!#{get_child(name2,bob1[1][1,1],event)} is built"
    end
  elsif !get_child(name1,bob2[1][1,1],event).nil? && !get_child(name2,bob1[1][1,1],event).nil?
    if get_child(name1,bob2[1][1,1],event)=="Portia"
      event << "#{name2}!#{get_child(name1,bob2[1][1,1],event)} is built"
      event << "#{name1}!#{get_child(name2,bob1[1][1,1],event)} is born"
    elsif get_child(name2,bob1[1][1,1],event)=="Portia"
      event << "#{name2}!#{get_child(name1,bob2[1][1,1],event)} is born"
      event << "#{name1}!#{get_child(name2,bob1[1][1,1],event)} is built"
    else
      event << "#{name2}!#{get_child(name1,bob2[1][1,1],event)} and #{name1}!#{get_child(name2,bob1[1][1,1],event)} are born"
    end
  elsif get_child(name1,bob2[1][1,1],event)=="Portia"
    event << "#{name2}!#{get_child(name1,bob2[1][1,1],event)} is built"
  elsif get_child(name2,bob1[1][1,1],event)=="Portia"
    event << "#{name1}!#{get_child(name2,bob1[1][1,1],event)} is built"
  elsif !get_child(name1,bob2[1][1,1],event).nil?
    event << "#{name2}!#{get_child(name1,bob2[1][1,1],event)} is born"
  elsif !get_child(name2,bob1[1][1,1],event).nil?
    event << "#{name1}!#{get_child(name2,bob1[1][1,1],event)} is born"
  end
  if [name1,name2].include?('Takumi') && [name1,name2].include?('Azura')
    event << "My developer becomes happy that someone else ships best *Fates* ship."
  elsif [name1,name2].include?("Soleil") || name1[name1.length-7,7]=='!Soleil' || name2[name2.length-7,7]=='!Soleil'
    if [name1,name2].include?("Ophelia") || name1[name1.length-8,8]=='!Ophelia' || name2[name2.length-8,8]=='!Ophelia'
      event << "Magical lesbian shenanigans ensue."
    elsif [name1,name2].include?("Nina") || name1[name1.length-5,5]=='!Nina' || name2[name2.length-5,5]=='!Nina'
      event << "They spend more time debating yaoi vs. yuri than actually doing anything."
    end
  end
  return nil
end

def levelup_unit(bot,event,args=nil)
  args=event.message.text.downcase.split(' ') if args.nil?
  args=splice(event)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  if args.nil?
    event.respond("Please include a class name and/or a unit name.")
    return nil
  elsif args.length.zero?
    event.respond("Please include a class name and/or a unit name.")
    return nil
  end
  f=parse_args(event,game,args,false)
  unit=f[0]
  clss=f[1]
  apt=f[2]
  mem=f[3]
  g=f[4]
  ### displaying data ###
  unit=["default","1cX","",[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],"",""] if unit.nil? # no unit defined
  clss=["default","","X",[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]] if clss.nil? # no class defined
  disp="__**#{gender_adjust(clss[0],unit[1][1,1],true,g).gsub(' (C)','')}**!#{unit[0]}"
  if disp=="__**Maid**!**Micro Mermaid Megankarp**" && rand(3).zero?
    fullname="__**Micro Meido Magikarp Mermaid Megan**"
  else
    fullname=disp
  end
  fullname="#{fullname} *(with Aptitude)*" if apt>0
  fullname="#{fullname}__"
  if apt>0 && game==""
    apt=10
    apt=20 if unit[1][2]=='A'
    apt=20 if unit[1][2]=='T'
  end
  fgame='Fates'
  fgame='X' if unit[1][2]=='X'
  fgame='Awakening' if unit[1][2]=='A'
  fgame='Three Houses' if unit[1][2]=='T'
  b=["HP","Strength","Magic","Skill","Speed","Luck","Defense","Resistance"]
  if unit[1][2]=='T'
    b[3]='Dexterity'
    b.push('Charm')
  elsif clss[1]=='Three Houses' || game=='Three Houses'
    b.push('Charm')
  end
  b2=[]
  text=""
  f2=0
  for i in 0...b.length
    unit[3][i]=0 if unit[3][i].nil?
    clss[3][i]=0 if clss[3][i].nil?
    x=unit[3][i].to_i+clss[3][i].to_i+apt
    y=x/100
    x=x%100
    r=rand(100)
    y+=1 if r<=x
    b2[i]=y*1
    f2+=1 if y>0
  end
  if f2<2
    if unit[1][0,1]=='1' && unit[1][1,1]!='c' && ['A','F','G'].include?(unit[1][2,1]) # Gen 1 non-avatar characters from Fateswakining
    elsif game != 'Three Houses' && unit[1][2,1]!='T'                                 # any Fateswakening character unless 3H mechanics are forced
    elsif ['Jeritza','Jeralt','Manuela','Hanneman','Seteth','Catherine','Shamir','Alois','Gilbert','Anna'].include?(unit[0].gsub('**','').split(' ')[0]) # 3H non-students
    else
      bb=[]
      for i in 0...b.length
        unit[3][i]=0 if unit[3][i].nil?
        clss[3][i]=0 if clss[3][i].nil?
        x=unit[3][i].to_i+clss[3][i].to_i+apt
        for i2 in 0...x
          bb.push(i)
        end
      end
      for i in 0...(2-f2)
        x=bb.sample
        b2[x]+=1
        bb=bb.reject{|q| q==x}
      end
    end
  end
  for i in 0...b2.length
    text="#{text}\n#{b[i]} went up by #{b2[i]}" if b2[i]>0
  end
  text='No stats increased' if text.length==0
  foot=['bad level-up','okay level-up','decent level-up','amazing level-up']
  f=foot[[f2/2,foot.length].min]
  f="#{f} adjusted by student failsafe" if f2<2 && b2.reject{|q| q<=0}.length>=2
  xcolor=embed_color_x(unit[2],clss,fgame)
  xcolor=0x010101 if unit[2]!="Cross-game child" && clss[1][0]!=unit[1][2] && clss[1].length>0
  create_embed(event,fullname,text,xcolor,f)
end

def crest_parse(bot,event,args=nil)
  args=event.message.text.downcase.split(' ') if args.nil?
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  if args.nil? || args.length.zero?
    event.respond "Please include a crest name, or a unit/weapon who has a crest"
    return nil
  end
  bob4=find_crest(args.join(' '),event)
  k=[]
  if bob4.nil?
    bob4=find_unit("Three Houses",args.join(' '),event)
    if bob4.nil?
      bob4=find_item("Three Houses",args.join(' '),event)
      if bob4.nil?
        event.respond "Please include a crest name, or a unit/weapon who has a crest"
        return nil
      elsif bob4[1]!='Three Houses' || !bob4[7].include?('Crest of')
        event.respond "#{bob4[0]} is not bound to any Crests.  Please try a different item."
        return nil
      else
        data_load()
        crst=@crests.map{|q| q}
        for i in 0...crst.length
          k.push(crst[i][0]) if bob4[7].downcase.include?("Crest of #{crst[i][0]}".downcase)
        end
      end
    elsif bob4[1][2,1]!='T' || bob4[9].nil? || bob4[9].length<=0
      event.respond "#{bob4[0]} does not have any Crests.  Please try a different unit."
      return nil
    elsif bob4[9][0]=='Mystery'
      m=bob4[9][1].gsub(' (minor)','').gsub('The','the')
      bob4[0]=bob4[0].split(' ')[0] unless bob4[0]=='Ferdinand von Aegir'
      event.respond "#{bob4[0]}'s Crest is a mystery in-game.  To look up the actual crest, use its name:  ||Crest of **#{m}**||"
      return nil
    else
      for i in 0...bob4[9].length
        k.push(bob4[9][i].gsub(' (minor)',''))
      end
    end
  else
    k.push(bob4[0])
  end
  if k.nil? || k.length<=0
    event.respond "Please include a crest name, or a unit/weapon who has a crest"
    return nil
  end
  for i in 0...k.length
    crest_display(bot,event,k[i])
  end
  return nil
end

def crest_display(bot,event,name)
  if name.include?('||')
    event.respond "The unit's Crest is a spoiler.  If you wish to look it up, please use its name: ||Crest of **#{name.gsub('||','')}**||"
    return nil
  end
  bob4=find_crest(name,event)
  if bob4[0]=='Mystery'
    name='Mystery Crest'
  elsif bob4[0]=='The Beast'
    name='Crest of the Beast'
  else
    name="Crest of #{bob4[0]}"
  end
  f=[]
  f.push(["Proc Rates","*Major Crest:* #{bob4[2][0]}%\n*Minor Crest:* #{bob4[2][1]}%\n~~*Crest item:* #{bob4[2][2]}%~~"])
  data_load()
  untz=@units.reject{|q| q[1][2,1]!='T' || q[9].nil? || q[9].length<=0 || !has_any?([bob4[0],"#{bob4[0]} (minor)","||#{bob4[0]}||"],q[9])}
  for i in 0...untz.length
    untz[i][0]=untz[i][0].split(' ')[0] unless untz[i][0]=='Ferdinand von Aegir'
    if untz[i][9][0]=='Mystery'
      untz[i][0]="||#{untz[i][0]}|| (labeled as Mystery)"
    elsif untz[i][9].include?(bob4[0])
    elsif untz[i][9].include?("#{bob4[0]} (minor)")
      untz[i][0]="#{untz[i][0]} (minor)"
    elsif untz[i][9].include?("||#{bob4[0]}||")
      untz[i][0]="||#{untz[i][0]}||"
    end
  end
  f.push(['Units with this Crest',untz.map{|q| q[0]}.sort{|a,b| a.gsub('||','')<=>b.gsub('||','')}.join("\n")]) if untz.length>0
  itmz=@items.reject{|q| q[1]!='Three Houses' || !q[7].downcase.include?("Crest of #{bob4[0]}".downcase)}
  for i in 0...itmz.length
    if itmz[i][0]=='Sublime Creator Sword'
      itmz[i]=nil
    elsif itmz[i][0]=='Sword of the Creator'
      itmz[i][1]=1
      itmz[i][0]="#{itmz[i][0]} ||(Sublime)||"
    elsif itmz[i][7].include?("Hero's Relic")
      itmz[i][1]=1
      itmz[i][0]="#{itmz[i][0]} (Relic)"
    elsif itmz[i][7].include?("Sacred")
      itmz[i][1]=2
      itmz[i][0]="#{itmz[i][0]} (Sacred)"
    elsif itmz[i][7].include?("Replica")
      itmz[i][1]=3
    else
      itmz[i][1]=4
    end
  end
  itmz.compact!
  f.push(['Items for this Crest',itmz.sort{|a,b| (a[1]<=>b[1])==0 ? a[0].gsub('||','')<=>b[0].gsub('||','') : (a[1]<=>b[1])}.map{|q| q[0]}.join("\n")]) if untz.length>0
  f=nil if f.length<=0
  create_embed(event,"__**#{name}**__","#{bob4[1]}",0x2D6864,nil,nil,f)
end

def combat_art_parse(bot,event,args=nil)
  args=event.message.text.downcase.split(' ') if args.nil?
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  if args.nil? || args.length.zero?
    event.respond "Please include a name of a combat art."
    return nil
  end
  bob4=find_combat_art(args.join(' '),event)
  if bob4.nil?
    event.respond "Please include a name of a combat art."
    return nil
  end
  text=''
  data_load()
  if bob4[5].nil? || bob4[5]=='-'
  elsif !@classes.find_index{|q| q[0]==bob4[5]}.nil?
    text="**Exclusive to the #{bob4[5]} class**"
  elsif !@items.find_index{|q| q[0]==bob4[5]}.nil?
    text="**Can only be used with the weapon #{bob4[5]}**"
  else
    text="**Can only be used by #{bob4[5].downcase}**"
  end
  if bob4[1]=='Other' && bob4[2].reject{|q| q=='-'}.length<=0
    text="#{text}\n**Range:** #{bob4[3].gsub('~','-')}" unless bob4[3]=='-'
  else
    text="#{text}\n**Weapon Type:** #{bob4[1]}" unless bob4[1]=='Other'
    if bob4[3]=='-' && bob4[2][0]=='-'
    elsif bob4[3]=='-' || bob4[2][0]=='-'
      text="#{text}\n**Might:** +#{bob4[2][0]}" unless bob4[2][0]=='-'
      text="#{text}\n**Range:** #{bob4[3].gsub('~','-')}" unless bob4[3]=='-'
    else
      text="#{text}\n**Might:** +#{bob4[2][0]}  \u200B  \u200B  \u200B  **Range:** #{bob4[3].gsub('~','-')}"
    end
    if bob4[2][1]=='-' && bob4[2][2]=='-'
    elsif bob4[2][1]=='-' || bob4[2][2]=='-'
      text="#{text}\n**Hit:** #{'+' unless bob4[2][1].to_i<0}#{bob4[2][1]}" unless bob4[2][1]=='-'
      text="#{text}\n**Crit:** #{bob4[2][2]}" unless bob4[2][2]=='-'
    else
      text="#{text}\n**Hit:** #{'+' unless bob4[2][1].to_i<0}#{bob4[2][1]}  \u200B  \u200B  \u200B  **Crit:** #{bob4[2][2]}"
    end
  end
  text="#{text}\n**Durability Cost:** #{bob4[4]}" unless bob4[4]=='-'
  text="#{text}\n**Additional Info:** #{bob4[6]}" unless bob4[6]=='-'
  create_embed(event,"__**#{bob4[0]}**__",text,0x2D6864)
end

bot.command([:combat,:art,:arts,:combatart,:combatarts]) do |event, *args|
  return nil if overlap_prevent(event)
  combat_art_parse(bot,event,args)
end

bot.command(:crest) do |event, *args|
  return nil if overlap_prevent(event)
  crest_parse(bot,event,args)
end

bot.command([:bday,:birthday,:bdays,:birthdays]) do |event, *args|
  return nil if overlap_prevent(event)
  msg=nil
  if args.nil? || args.length<=0
  elsif ['here','posts','post','announcements','announcement','announce'].include?(args[0].downcase)
    args.shift
    if event.server.nil?
      msg='This command is not available in PM.  Showing birthday list instead.'
      args=[]
    elsif !is_mod?(event.user,event.server,event.channel)
      msg='You are not a mod.  Showing birthday list instead.'
      args=[]
    elsif @shardizard==4
      msg='This command is not available in debug mode.  Showing birthday list instead.'
      args=[]
    elsif @bday_channels[event.server.id]==event.channel.id
      event.respond "This channel is already being used for birthday announcements.\nIf you wish to stop them, have a mod use the command `FE!birthday off` in this channel."
      return nil
    elsif !(args.nil? || args.length<=0) && ['off','no','false'].include?(args[0].downcase)
    else
      m="<##{@bday_channels[event.server.id]}>"
      @bday_channels[event.server.id]=event.channel.id
      x=@bday_channels
      open("C:/Users/#{@mash}/Desktop/devkit/FEBDayPosts.rb", 'w') { |f|
        f.puts x.to_s.gsub('=>',' => ').gsub(', ',",\n  ").gsub('{',"@bday_channels = {\n  ").gsub('}',"\n}")
      }
      str="I will now make birthday announcements in this channel, at 4:00 AM U.S. Central Time on affected birthdays."
      str="#{str}\nI will no longer do the announcements in #{m}." if m.length>3
      event.respond str
      return nil
    end
  end
  if args.nil? || args.length<=0
  elsif ['off','no','false'].include?(args[0].downcase)
    if event.server.nil?
      msg='This command is not available in PM.  Showing birthday list instead.'
    elsif !is_mod?(event.user,event.server,event.channel)
      msg='You are not a mod.  Showing birthday list instead.'
    elsif @shardizard==4
      msg='This command is not available in debug mode.  Showing birthday list instead.'
    elsif @bday_channels[event.server.id].nil?
      msg='This server already lacks a birthday announcement channel.  Showing birthday list instead.'
    elsif @bday_channels[event.server.id]!=event.channel.id
      msg="This server's birthday announcement channel is <##{@bday_channels[event.server.id]}>.  If you wish to turn off birthday announcements, please use this command there.\nShowing birthday list instead."
    else
      @bday_channels[event.server.id]=nil
      @bday_channels.compact!
      x=@bday_channels
      open("C:/Users/#{@mash}/Desktop/devkit/FEBDayPosts.rb", 'w') { |f|
        f.puts x.to_s.gsub('=>',' => ').gsub(', ',",\n  ").gsub('{',"@bday_channels = {\n  ").gsub('}',"\n}")
      }
      event.respond "I will no longer make birthday announcements in this server."
      return nil
    end
  end
  bday_text(event,bot,msg)
end

bot.command([:find, :sort, :list, :search]) do |event, *args|
  return nil if overlap_prevent(event)
  get_unit_list(event,bot,args)
end

bot.command([:embeds,:embed]) do |event|
  return nil if overlap_prevent(event)
  embedless_swap(bot,event)
end

bot.command([:gay,:homosexuality,:homo]) do |event, m|
  return nil if overlap_prevent(event)
  if event.server.nil?
    event.respond "This command cannot be used in a PM"
    return nil
  end
  metadata_load()
  x=(!@homo_servers.include?(event.server.id))
  unless m.nil?
    x=true if ['on','yes','true'].include?(m.downcase)
    x=false if ['off','no','false'].include?(m.downcase)
  end
  if x && !@homo_servers.include?(event.server.id)
    @homo_servers.push(event.server.id)
  elsif !x && @homo_servers.include?(event.server.id)
    for i in 0...@homo_servers.length
      @homo_servers[i]=nil if @homo_servers[i]==event.server.id
    end
    @homo_servers.compact!
  end
  metadata_save()
  event << "The homosexuality filter for this server has been #{"raised" unless @homo_servers.include?(event.server.id)}#{"lowered" if @homo_servers.include?(event.server.id)}."
  if @homo_servers.include?(event.server.id)
    event << "Characters of the same gender can marry and have kids."
  else
    event << "Characters of the same gender are prohibited from marrying and having kids.  The exceptions are the avatar characters."
  end
end

bot.command([:sibling,:incest,:wincest]) do |event, m|
  return nil if overlap_prevent(event)
  if event.server.nil?
    event.respond "This command cannot be used in a PM"
    return nil
  end
  x=(!@incest_servers.include?(event.server.id))
  unless m.nil?
    x=true if ['on','yes','true'].include?(m.downcase)
    x=false if ['off','no','false'].include?(m.downcase)
  end
  if x && !@incest_servers.include?(event.server.id)
    @incest_servers.push(event.server.id)
  elsif !x && @incest_servers.include?(event.server.id)
    for i in 0...@incest_servers.length
      @incest_servers[i]=nil if @incest_servers[i]==event.server.id
    end
    @incest_servers.compact!
  end
  metadata_save()
  event << "The incest filter for this server has been #{"raised" unless @incest_servers.include?(event.server.id)}#{"lowered" if @incest_servers.include?(event.server.id)}."
  if @incest_servers.include?(event.server.id)
    event << "Siblings/relatives can marry and have kids."
  else
    event << "Siblings/relatives are prohibited from marrying and having kids."
  end
end

bot.command([:bugreport, :suggestion, :feedback]) do |event, *args|
  return nil if overlap_prevent(event)
  x=['fe!','3h!','fe?','3h?','fea!','fea?','fef!','fef?','fe3h!','fe3h?','feth!','feth?','fe13!','fe13?','fe14!','fe14?','fe16!','fe16?']
  x.push(@prefixes[event.server.id]) unless event.server.nil? || @prefixes[event.server.id].nil?
  bug_report(bot,event,args,3,['Plegian/Vallite','Ylissian/Hoshidan','Valmese/Nohrian'],'Alliance',x)
end

bot.command(:prefix) do |event, prefix|
  return nil if overlap_prevent(event)
  if prefix.nil?
    event.respond 'No prefix was defined.  Try again.'
    return nil
  elsif event.server.nil?
    event.respond 'This command is not available in PM.'
    return nil
  elsif !is_mod?(event.user,event.server,event.channel)
    event.respond 'You are not a mod.'
    return nil
  elsif ['feh!','feh?','f?','e?','h?','fgo!','fgo?','fg0!','fg0?','liz!','liz?','iiz!','iiz?','fate!','fate?','dl!','dl?','fe!','fe14!','fef!','fe13!','fea!','fe?','fe14?','fef?','fe13?','fea?'].include?(prefix.downcase)
    event.respond "That is a prefix that would conflict with either myself or another one of my developer's bots."
    return nil
  end
  @prefixes[event.server.id]=prefix
  prefixes_save()
  event.respond "This server's prefix has been saved as **#{prefix}**"
end

bot.command(:addalias) do |event, newname, unit, modifier, modifier2|
  return nil if overlap_prevent(event)
  add_new_alias(bot,event,newname,unit,modifier,modifier2)
  return nil
end

bot.command(:alias) do |event, newname, unit, modifier, modifier2|
  return nil if overlap_prevent(event)
  add_new_alias(bot,event,newname,unit,modifier,modifier2,1)
  return nil
end

bot.command([:checkaliases,:aliases,:seealiases]) do |event, *args|
  return nil if overlap_prevent(event)
  disp_aliases(bot,event,args)
end

bot.command([:serveraliases,:saliases]) do |event, *args|
  return nil if overlap_prevent(event)
  disp_aliases(bot,event,args,1)
end

bot.command([:deletealias,:removealias]) do |event, name|
  return nil if overlap_prevent(event)
  game=game_proc(event)
  game="Fates" if game.length<=0
  nicknames_load()
  if name.nil?
    event.respond "I can't delete nothing, silly!" if name.nil?
    return nil
  elsif !is_mod?(event.user,event.server,event.channel)
    event.respond "You are not a mod."
    return nil
  elsif find_unit(game,name,event).nil? && find_class(name,event,game).nil? && find_skill(game,name,event).nil? && find_item(game,name,event).nil?
    event.respond "#{name} is not an alias, silly!"
    return nil
  end
  j=[find_unit(game,name,event),'Unit']
  j=[find_class(name,event,game),'Class'] if j[0].nil?
  j=[find_skill(game,name,event),'Skill'] if j[0].nil?
  j=[find_item(game,name,event),'Item'] if j[0].nil?
  j[0]=j[0][0]
  k=0
  k=event.server.id unless event.server.nil?
  for izzz in 0...@names.length
    if @names[izzz][1].downcase==name.downcase
      if @names[izzz][3].nil? && event.user.id != 167657750971547648
        event.respond "You cannot remove a global alias"
        return nil
      elsif @names[izzz][3].nil? || @names[izzz][3].include?(k)
        unless @names[izzz][3].nil?
          for izzz2 in 0...@names[izzz][3].length
            @names[izzz][3][izzz2]=nil if @names[izzz][3][izzz2]==k
          end
          @names[izzz][3].compact!
        end
        @names[izzz]=nil if @names[izzz][3].nil? || @names[izzz][3].length<=0
      end
    end
  end
  @names.uniq!
  @names.compact!
  logchn=386658080257212417
  logchn=431862993194582036 if @shardizard==4
  srv=0
  srv=event.server.id unless event.server.nil?
  srvname="PM with dev"
  srvname=bot.server(srv).name unless event.server.nil? && srv==0
  bot.channel(logchn).send_message("**Server:** #{srvname} (#{srv})\n**Channel:** #{event.channel.name} (#{event.channel.id})\n**User:** #{event.user.distinct} (#{event.user.id})\n~~**#{j[1]} Alias:** #{name} for #{j[0]}~~ **DELETED**.")
  open("C:/Users/#{@mash}/Desktop/devkit/FENames.txt", 'w') { |f|
    for i in 0...@names.length
      f.puts "#{@names[i].to_s}#{"\n" if i<@names.length-1}"
    end
  }
  event.respond "#{name} has been removed from #{j[0]}'s names."
  nicknames_load()
  nzzz=@names.reject{|q| q[0]!='Unit'}
  nzzz2=@names.reject{|q| q[0]!='Class'}
  nzzz3=@names.reject{|q| q[0]!='Skill'}
  nzzz4=@names.reject{|q| q[0]!='Item'}
  if nzzz[nzzz.length-1].length>1 && nzzz[nzzz.length-1][2]>="Xander" && nzzz2[nzzz2.length-1].length>1 && nzzz2[nzzz2.length-1][2]>="Wyvern Rider" && nzzz3[nzzz3.length-1].length>1 && nzzz3[nzzz3.length-1][2]>="Defensetaker" && nzzz4[nzzz4.length-1].length>1 && nzzz4[nzzz4.length-1][2]>="Armorslayer"
    bot.channel(logchn).send_message("Alias list saved.")
    open("C:/Users/#{@mash}/Desktop/devkit/FENames2.txt", 'w') { |f|
      for i in 0...nzzz.length
        f.puts "#{nzzz[i].to_s}#{"\n" if i<nzzz.length-1}"
      end
      for i in 0...nzzz2.length
        f.puts "#{nzzz2[i].to_s}#{"\n" if i<nzzz2.length-1}"
      end
      for i in 0...nzzz3.length
        f.puts "#{nzzz3[i].to_s}#{"\n" if i<nzzz3.length-1}"
      end
      for i in 0...nzzz4.length
        f.puts "#{nzzz4[i].to_s}#{"\n" if i<nzzz4.length-1}"
      end
    }
    bot.channel(logchn).send_message("Alias list has been backed up.")
  end
end

bot.command(:invite) do |event, user|
  return nil if overlap_prevent(event)
  usr=event.user
  txt="**You can invite me to your server with this link: <https://goo.gl/v3ADBG>**\nTo look at my source code: <https://github.com/Rot8erConeX/FEIndex/blob/master/FEIndex/FEIndex.rb>\nTo follow my creator's development Twitter and learn of updates: <https://twitter.com/EliseBotDev>\nIf you suggested me to server mods and they ask what I do, show them this image: https://raw.githubusercontent.com/Rot8erConeX/FEIndex/master/FEIndex/MarketingRobin.png"
  user_to_name="you"
  user=nil if event.message.mentions.length<=0 && user.to_i.to_s != user
  unless user.nil?
    if /<@!?(?:\d+)>/ =~ user
      usr=event.message.mentions[0]
      txt="This message was sent to you at the request of #{event.user.distinct}.\n\n#{txt}"
      user_to_name=usr.distinct
    else
      usr=bot.user(user.to_i)
      txt="This message was sent to you at the request of #{event.user.distinct}.\n\n#{txt}"
      user_to_name=usr.distinct
    end
  end
  usr.pm(txt)
  event.respond "A PM was sent to #{user_to_name}." unless event.server.nil? && user_to_name=="you"
end

bot.command(:proc) do |event, *args|
  return nil if overlap_prevent(event)
  args=splice(event)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  game="Fates" if game.length<=0
  if game=="Three Houses"
    event.respond "There is only one offensive proc skill in 3H: Lethality.  This command is therefore useless.  Switching to Fates' mechanics."
    game="Fates"
  end
  stat=0
  bob=false
  if args.nil?
    stat=rand(64)+1
  elsif args.length.zero?
    stat=rand(64)+1
  else
    for i in 0...args.length
      if args[i][0,2]=="~~"
        bob=true
        args[i]=args[i][2,args[i].length-2]
      end
      if args[i][args[i].length-2,2]=="~~"
        bob=true
        args[i]=args[i][0,args[i].length-2]
      end
      if args[i].to_i != 0
        bob=true if args[i].to_i<0
        stat=args[i].to_i.abs if stat.zero?
        args[i]=nil
      end
    end
    args.compact!
  end
  names=["Lethality","Aether","Astra","Sol","Luna","Ignis","Vengeance"]
  names.push("Dragon Fang") if game != "Awakening"
  names.push("Rend Heaven") if game != "Awakening"
  names.push("Glacies") if event.user.id==256379815601373184 || (event.user.id==167657750971547648 && !event.server.nil? && [256291408598663168,285663217261477889].include?(event.server.id))
  names2=[]
  names3=[]
  for i in 0...args.length
    next if args[i].length<=2
    bob=true if args[i].downcase=="not"
    if args[i][0,2]=="~~"
      bob=true
      args[i]=args[i][2,args[i].length-2]
    end
    if args[i][args[i].length-2,2]=="~~"
      bob=true
      args[i]=args[i][0,args[i].length-2]
    end
    names2.push("Lethality") if args[i].downcase=="lethality"[0,args[i].length]
    names2.push("Aether") if args[i].downcase=="aether"[0,args[i].length]
    names2.push("Astra") if args[i].downcase=="astra"[0,args[i].length]
    names2.push("Dragon Fang") if args[i].downcase=="dragon"[0,args[i].length] && game != "Awakening"
    names2.push("Glacies") if args[i].downcase=="glacies"[0,args[i].length]
    names2.push("Sol") if args[i].downcase=="sol"[0,args[i].length]
    names2.push("Luna") if args[i].downcase=="luna"[0,args[i].length]
    names2.push("Ignis") if args[i].downcase=="ignis"[0,args[i].length]
    names2.push("Rend Heaven") if args[i].downcase=="rend"[0,args[i].length] && game != "Awakening"
    names2.push("Vengeance") if args[i].downcase=="vengeance"[0,args[i].length]
    names3.push("Hoshidan Unity") if args[i].downcase=="hoshidan"[0,args[i].length]
    names3.push("Hoshidan Unity") if args[i].downcase=="king"[0,args[i].length]
    names3.push("Rightful God") if args[i].downcase=="god"[0,args[i].length]
    names3.push("Nohrian Trust") if args[i].downcase=="nohrian"[0,args[i].length] && game != "Awakening"
    names3.push("Quixotic") if args[i].downcase=="quixotic"[0,args[i].length]
  end
  if names2.length>0 && bob
    for i in 0...names.length
      for j in 0...names2.length
        names[i]=nil if names[i]==names2[j]
      end
    end
    names.compact!
  elsif names2.length>0
    names=names2
    if !names3.include?("Nohrian Trust") && names.length+names3.length>5
      names=[]
      for i in 0...[5-names3.length,names2.length].min
        names.push(names2[i])
      end
    end
  end
  if names3.length>0
    for i in 0...names3.length
      names.push(names3[i])
    end
  end
  stat=rand(64)+1 if stat.zero?
  # stat name, skill multiplier, "display" percent, actual percent, remaining chances
  skills=[["Lethality",0.25,stat/4,0,0],
          ["Aether",0.50,stat/2,0,0],
          ["Astra",0.50,stat/2,0,0],
          ["Dragon Fang",0.75,3*stat/4,0,0],
          ["Glacies",0.75,3*stat/4,0,0],
          ["Sol",1.00,stat,0,0],
          ["Luna",1.00,stat,0,0],
          ["Ignis",1.00,stat,0,0],
          ["Rend Heaven",1.50,3*stat/2,0,0],
          ["Vengeance",1.50,3*stat/2,0,0]]
  skills[9][1]=2 if game=="Awakening"
  skills[9][2]=2*stat if game=="Awakening"
  for i in 0...skills.length
    skills[i][2]+=10 if names.include?("Hoshidan Unity")
    skills[i][2]+=30 if names.include?("Rightful God")
    skills[i][2]+=15 if names.include?("Quixotic")
    skills[i]=nil if !names.include?(skills[i][0])
  end
  skills.compact!
  skills[0][3]=skills[0][2]*0.01
  skills[0][4]=[[1-skills[0][3],1].min,0].max
  name="**__*Skill Stat:* #{stat}__**"
  text="**#{skills[0][0]}:** ~~#{skills[0][2]}%~~ #{(skills[0][3]*100).round(0)}%"
  for i in 1...skills.length
    skills[i][3]=skills[i][2]*skills[i-1][4]*0.01
    skills[i][4]=[[skills[i-1][4]-skills[i][3],0].max,1].min
    text="#{text}\n**#{skills[i][0]}:** ~~#{skills[i][2]}%~~ #{(skills[i][3]*100).round(4)}%"
  end
  text="#{text}\n*No skill procs:* #{(skills[skills.length-1][4]*100).round(4)}%"
  create_embed(event,name,text,0x880000)
end

bot.command([:unit,:character,:char,:chara]) do |event, *args|
  return nil if overlap_prevent(event)
  args=splice(event)
  unit_parse(event,bot,args)
end

bot.command(:class) do |event, *args|
  return nil if overlap_prevent(event)
  class_parse(event,bot,args)
end

bot.command([:skill,:ability,:abil]) do |event, *args|
  return nil if overlap_prevent(event)
  skill_parse(event,bot,args)
end

bot.command([:marry,:marriage,:support]) do |event, name1, name2|
  return nil if overlap_prevent(event)
  marry_units(bot,event,name1,name2)
end

bot.command([:item,:weapon]) do |event, *args|
  return nil if overlap_prevent(event)
  item_parse(event,bot,args)
end

bot.command([:job, :data, :stats]) do |event, *args|
  return nil if overlap_prevent(event)
  parse_job(event,args,bot,0)
  return nil
end

bot.command([:levelup, :level]) do |event, *args|
  return nil if overlap_prevent(event)
  levelup_unit(bot,event,args)
end

bot.command([:offspringseal,:childseal,:offspring]) do |event, *args|
  return nil if overlap_prevent(event)
  args=splice(event)
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=game_proc(event)
  if args.nil?
    event.respond("Please include a class name and/or a unit name.")
    return nil
  elsif args.length.zero?
    event.respond("Please include a class name and/or a unit name.")
    return nil
  end
  if args[0].downcase=="roy"
    args[0]=nil
    args.compact!
    return nil if args.length.zero?
  end
  level=0
  for i in 0...args.length
    if args[i].to_i>0
      level=args[i].to_i
      args[i]=nil
    end
  end
  args.compact!
  f=parse_args(event,game,args,false)
  unit=f[0]
  clss=f[1]
  apt=f[2]
  mem=f[3]
  g=f[4]
  disp=''
  if level==0
    disp="No level was given, showing promotion to level 18."
    level=18
  elsif level > 27
    disp="#{level} is being interpreted as a chapter number, which means the promotion would be to level #{(level-18)*2}\nOr rather, this would be the case if Chapter #{level} existed.  Showing promotion to level 18."
    level=18
  elsif level > 18 
    disp="#{level} is being interpreted as a chapter number,\nwhich means the promotion would be to level #{(level-18)*2}."
    level=(level-18)*2 
  else 
    disp="#{level} is being interpreted as the level being promoted to."
  end
  ### displaying data ###
  unit=["default","1cX","",[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],"",""] if unit.nil? # no unit defined
  if unit[1][0,1].to_i==1
    event.respond "#{unit[0].gsub('*','')}, as a first-gen unit, cannot use an Offspring Seal."
    return nil
  end
  clss=["default","","",[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0]] if clss.nil? # no class defined
  disp="__**#{gender_adjust(clss[0],unit[1][1,1],true,g).gsub(' (C)','')}**!#{unit[0]}__\n#{disp}"
  if apt>0 && game==""
    apt=10
    apt=20 if unit[1][2]=='A'
    apt=20 if unit[1][2]=='T'
  end
  fgame='Fates'
  fgame='X' if unit[1][2]=='X'
  fgame='Awakening' if unit[1][2]=='A'
  fgame='Three Houses' if unit[1][2]=='T'
  base_clss=@classes[@classes.find_index{|q| q[0]==unit[6][0] && q[1][0,1]==unit[1][2,1]}]
  b=["HP","Strength","Magic","Skill","Speed","Luck","Defense","Resistance"]
  b=["HP","Strength","Magic","Dexterity","Speed","Luck","Defense","Resistance","Charm"] if unit[1][2]=='T'
  text=""
  f=0
  for i in 0...b.length
    unit[3][i]=0 if unit[3][i].nil?
    clss[3][i]=0 if clss[3][i].nil?
    x=unit[3][i].to_i+clss[3][i].to_i+apt
    y=x*level/100+clss[5][i].to_i-base_clss[5][i].to_i
    text="#{text}\n#{b[i]} went up by #{y}" if y>0
    f+=1 if y>0
  end
  text='No stats increased' if text.length==0
  xcolor=embed_color(unit[2],fgame)
  xcolor=0x010101 if unit[2]!="Cross-game child" && clss[1][0]!=unit[1][2]
  create_embed(event,disp,text,xcolor)
end

bot.command(:backupaliases) do |event|
  return nil if overlap_prevent(event)
  return nil unless event.user.id==167657750971547648
  nicknames_load()
  @names.uniq!
  @names.sort! {|a,b| (spaceship_order(a[0]) <=> spaceship_order(b[0])) == 0 ? ((a[2].downcase <=> b[2].downcase) == 0 ? (a[1].downcase <=> b[1].downcase) : (a[2].downcase <=> b[2].downcase)) : (spaceship_order(a[0]) <=> spaceship_order(b[0]))}
  zunits=@names.reject{|q| q[0]!='Unit'}
  if zunits[zunits.length-1].length<=1 || zunits[zunits.length-1][2]<'Yarne'
    event.respond 'Alias list has __***NOT***__ been backed up, as alias list has been corrupted.'
    return nil
  end
  nzzzzz=@names.map{|a| a}
  open("C:/Users/#{@mash}/Desktop/devkit/FENames2.txt", 'w') { |f|
    for i in 0...nzzzzz.length
      f.puts "#{nzzzzz[i].to_s}#{"\n" if i<nzzzzz.length-1}"
    end
  }
  event.respond "Alias list has been backed up."
  return nil
end

bot.command(:restorealiases) do |event|
  return nil if overlap_prevent(event)
  return nil unless [167657750971547648,bot.profile.id].include?(event.user.id) || event.channel.id==386658080257212417
  bot.gateway.check_heartbeat_acks = false
  if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FENames2.txt")
    b=[]
    File.open("C:/Users/#{@mash}/Desktop/devkit/FENames2.txt").each_line do |line|
      b.push(eval line)
    end
  else
    b=[]
  end
  nzzzzz=b.uniq
  if nzzzzz[nzzzzz.length-1][1]<"Yarne"
    event << "Last backup of the alias list has been corrupted.  Restoring from manually-created backup."
    if File.exist?("C:/Users/#{@mash}/Desktop/devkit/FENames3.txt")
      b=[]
      File.open("C:/Users/#{@mash}/Desktop/devkit/FENames3.txt").each_line do |line|
        b.push(eval line)
      end
    else
      b=[]
    end
    nzzzzz=b.uniq
  else
    event << "Last backup of the alias list being used."
  end
  open("C:/Users/#{@mash}/Desktop/devkit/FENames.txt", 'w') { |f|
    for i in 0...nzzzzz.length
      f.puts "#{nzzzzz[i].to_s}#{"\n" if i<nzzzzz.length-1}"
    end
  }
  event << "Alias list has been restored from backup."
end

bot.command(:sortaliases) do |event|
  return nil if overlap_prevent(event)
  return nil unless [167657750971547648,bot.profile.id].include?(event.user.id) || event.channel.id==386658080257212417
  nicknames_load()
  @names.uniq!
  @names.sort! {|a,b| (spaceship_order(a[0]) <=> spaceship_order(b[0])) == 0 ? ((a[2].downcase <=> b[2].downcase) == 0 ? (a[1].downcase <=> b[1].downcase) : (a[2].downcase <=> b[2].downcase)) : (spaceship_order(a[0]) <=> spaceship_order(b[0]))}
  open("C:/Users/#{@mash}/Desktop/devkit/FENames.txt", 'w') { |f|
    for i in 0...@names.length
      f.puts "#{@names[i].to_s}#{"\n" if i<@names.length-1}"
    end
  }
  event.respond "The alias list has been sorted alphabetically"
end

bot.command(:snagstats) do |event, f| # snags the number of members in each of the servers Robin is in
  return nil if overlap_prevent(event)
  nicknames_load()
  metadata_load()
  bot.servers.values(&:members)
  @server_data2[0][@shardizard]=bot.servers.length
  @server_data2[0][4]=1
  @server_data2[1][@shardizard]=bot.users.size
  metadata_save()
  numbers=[0,0,0,0,0,0,0,0]
  data_load()
  for i in 0...@units.length
    numbers[0]+=1
    numbers[1]+=1 unless @units[i][1][3]=='g'
  end
  for i in 0...@classes.length
    numbers[2]+=1
    numbers[3]+=1 unless @classes[i][2]=='Penumbra'
  end
  for i in 0...@skills.length
    numbers[4]+=1
    numbers[5]+=1 unless @skills[i][1]=='Gates'
  end
  for i in 0...@items.length
    numbers[6]+=1
    numbers[7]+=1 unless @items[i][1]=='Gates'
  end
  k=0
  k=event.server.id unless event.server.nil?
  b=[]
  File.open("C:/Users/#{@mash}/Desktop/devkit/RobinBot.rb").each_line do |line|
    l=line.gsub(' ','').gsub("\n",'')
    b.push(l) unless l.length<=0
  end
  f='' if f.nil?
  if ['servers','server','members','member','shard','shards','user','users','alliance','alliances','ally','allies'].include?(f.downcase)
    event << "**I am in #{longFormattedNumber(@server_data2[0].inject(0){|sum,x| sum + x })} servers, reaching #{longFormattedNumber(@server_data2[1].inject(0){|sum,x| sum + x })} unique members.**"
    event << "The Plegian/Vallite Alliance contains #{longFormattedNumber(@server_data2[0][0])} server#{"s" if @server_data2[0][0]!=1}, reaching #{longFormattedNumber(@server_data2[1][0])} unique members."
    event << "The Ylissian/Hoshidan Alliance contains #{longFormattedNumber(@server_data2[0][1])} server#{"s" if @server_data2[0][1]!=1}, reaching #{longFormattedNumber(@server_data2[1][1])} unique members."
    event << "The Valmese/Nohrian Alliance contains #{longFormattedNumber(@server_data2[0][2])} server#{"s" if @server_data2[0][2]!=1}, reaching #{longFormattedNumber(@server_data2[1][2])} unique members."
    event << "The Golden Alliance contains #{longFormattedNumber(@server_data2[0][4])} server#{"s" if @server_data2[0][4]!=1}, reaching #{longFormattedNumber(@server_data2[1][4])} unique members." if event.user.id==167657750971547648
    return nil
  elsif ['unit','units','chars','char','charas','chara','characters','character'].include?(f.downcase)
    u=@units.reject{|q| q[1][3]=='g'}
    u=@units.map{|q| q} if k==256291408598663168
    u2=@units.reject{|q| q[1][3]=='g'}
    event << "**There are #{numbers[1]} units#{", or #{numbers[0]} with Penumbrans included" if k==256291408598663168}.**"
    event << "This includes:"
    event << ''
    d=u2.map{|q| q[0]}.uniq.length
    d2=u.map{|q| q[0]}.uniq.length
    event << "#{d}#{" (#{d2})" unless d==d2} unique characters, based on name"
    event << "#{d-3+2}#{" (#{d2-3+2})" unless d==d2} actually unique characters"
    if safe_to_spam?(event)
      event << ''
      d=u2.reject{|q| q[1][0]!='1' || q[2].downcase.include?('capturable') || q[2].include?('Amiibo')}.length
      d2=u.reject{|q| q[1][0]!='1' || q[2].downcase.include?('capturable') || q[2].include?('Amiibo')}.length
      event << "#{d}#{" (#{d2})" unless d==d2} first-generation units"
      d=u2.reject{|q| q[1][0]!='2' || q[0]=='Portia'}.length
      d2=u.reject{|q| q[1][0]!='2' || q[0]=='Portia'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} second-generation units"
      d=u2.reject{|q| q[1][0]!='3'}.length
      d2=u.reject{|q| q[1][0]!='3'}.length
      if k==256291408598663168
        event << "(1 second-or-third-generation unit)"
        event << "#{d}#{" (#{d2})" unless d==d2} second-through-fourth-generation units"
      else
        event << "#{d}#{" (#{d2})" unless d==d2} second-or-third-generation units"
      end
      d=u2.reject{|q| !q[2].downcase.include?('capturable')}.length
      d2=u.reject{|q| !q[2].downcase.include?('capturable')}.length
      event << "#{d}#{" (#{d2})" unless d==d2} capturable bosses"
      d=u2.reject{|q| !q[2].include?('Amiibo')}.length
      d2=u.reject{|q| !q[2].include?('Amiibo')}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Amiibo units"
    end
    event << ''
    d=u2.reject{|q| q[1][1]!='c'}.length
    d2=u.reject{|q| q[1][1]!='c'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} variable-gender units"
    d=u2.reject{|q| q[1][1]!='m'}.length
    d2=u.reject{|q| q[1][1]!='m'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} male units"
    d=u2.reject{|q| q[1][1]!='f'}.length
    d2=u.reject{|q| q[1][1]!='f'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} female units"
    event << ''
    d=u2.reject{|q| q[1][2]!='A'}.length
    d2=u.reject{|q| q[1][2]!='A'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} units in *Awakening*"
    strs=[]
    d=u2.reject{|q| q[1][2]!='F' || q[1][3].nil? || !['b','B','e','r'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='F' || q[1][3].nil? || !['b','B','e','r'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} *Birthright*")
    d=u2.reject{|q| q[1][2]!='F' || q[1][3].nil? || !['c','C','e','r'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='F' || q[1][3].nil? || !['c','C','e','r'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} *Conquest*")
    d=u2.reject{|q| q[1][2]!='F' || q[1][3].nil? || !['b','c','r','R'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='F' || q[1][3].nil? || !['b','c','r','R'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} *Revelation*")
    if k===256291408598663168
      d=u2.reject{|q| q[1][3]!='g'}.length
      d2=u.reject{|q| q[1][3]!='g'}.length
      strs.push("#{d}#{" (#{d2})" unless d==d2} Penumbrans")
    end
    d=u2.reject{|q| q[1][2]!='F'}.length
    d2=u.reject{|q| q[1][2]!='F'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} units in *Fates*  ~~#{strs.join(', ')}~~"
    strs=[]
    d=u2.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['r','R'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['r','R'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} *Black Eagles*")
    d=u2.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['b','B'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['b','B'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} *Blue Lions*")
    d=u2.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['y','Y'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['y','Y'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} *Golden Deer*")
    d=u2.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['a','A'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['a','A'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} *Ashen Wolves*")
    d=u2.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['c','C','k','K'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['c','C','k','K'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} Knights of Seiros")
    d=u2.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['x','X'].include?(q[1][3])}.length
    d2=u.reject{|q| q[1][2]!='T' || q[1][3].nil? || !['x','X'].include?(q[1][3])}.length
    strs.push("#{d}#{" (#{d2})" unless d==d2} other")
    d=u2.reject{|q| q[1][2]!='T'}.length
    d2=u.reject{|q| q[1][2]!='T'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} units in *Three Houses*  ~~#{strs.join(', ')}~~"
    return nil
  elsif ['class','classes'].include?(f.downcase)
    c=@classes.reject{|q| q[2]=='Penumbra'}
    c=@classes.map{|q| q} if k==256291408598663168
    c2=@classes.reject{|q| q[2]=='Penumbra'}
    event << "**There are #{numbers[3]} classes#{", or #{numbers[2]} with Penumbra-exclusives included" if k==256291408598663168}.**"
    event << "This includes:"
    event << ''
    d=c2.map{|q| q[0]}.uniq.length
    d2=c.map{|q| q[0]}.uniq.length
    event << "#{d}#{" (#{d2})" unless d==d2} unique classes, based on name"
    event << ''
    d=c2.reject{|q| q[1]!='Awakening'}.length
    d2=c.reject{|q| q[1]!='Awakening'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} classes that come from *Awakening*"
    d=c2.reject{|q| q[1]!='Fates'}.length
    d2=c.reject{|q| q[1]!='Fates'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} classes that come from *Fates*"
    d=c2.reject{|q| q[1]!='Three Houses'}.length
    d2=c.reject{|q| q[1]!='Three Houses'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} classes that come from *Three Houses*"
    if safe_to_spam?(event)
      event << ''
      d=c2.reject{|q| q[2]!='Ylisse'}.length
      d2=c.reject{|q| q[2]!='Ylisse'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Ylissian class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Plegia'}.length
      d2=c.reject{|q| q[2]!='Plegia'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Plegian class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Valm'}.length
      d2=c.reject{|q| q[2]!='Valm'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Valmese class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| !['Regna Ferox','Rosanne','Warren'].include?(q[2])}.length
      d2=c.reject{|q| !['Regna Ferox','Rosanne','Warren'].include?(q[2])}.length
      event << "__#{d}#{" (#{d2})" unless d==d2} class#{"es" if [d,d2].max>1} from other *Awakening* countries__"
      d=c2.reject{|q| q[2]!='Hoshido'}.length
      d2=c.reject{|q| q[2]!='Hoshido'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Hoshidan class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Nohr'}.length
      d2=c.reject{|q| q[2]!='Nohr'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Nohrian class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| !['Valla','Corrin'].include?(q[2])}.length
      d2=c.reject{|q| !['Valla','Corrin'].include?(q[2])}.length
      event << "#{'__' unless k==256291408598663168}#{d}#{" (#{d2})" unless d==d2} Vallite class#{"es" if [d,d2].max>1}#{'__' unless k==256291408598663168}"
      if k==256291408598663168
        d=c2.reject{|q| q[2]!='Penumbra'}.length
        d2=c.reject{|q| q[2]!='Penumbra'}.length
        event << "__(#{d}#{" (#{d2})" unless d==d2} Penumbran class#{"es" if [d,d2].max>1})__"
      end
      d=c2.reject{|q| q[2]!='Adrestia'}.length
      d2=c.reject{|q| q[2]!='Adrestia'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Adrestian class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Faerghus'}.length
      d2=c.reject{|q| q[2]!='Faerghus'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Faerghese class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Leicester'}.length
      d2=c.reject{|q| q[2]!='Leicester'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Leicestrite class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Underground'}.length
      d2=c.reject{|q| q[2]!='Underground'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Underground class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Garreg Mach'}.length
      d2=c.reject{|q| q[2]!='Garreg Mach'}.length
      event << "__#{d}#{" (#{d2})" unless d==d2} general-use class#{"es" if [d,d2].max>1} for Garreg Mach members__"
      d=c2.reject{|q| q[2]!='DLC'}.length
      d2=c.reject{|q| q[2]!='DLC'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} DLC class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Amiibo'}.length
      d2=c.reject{|q| q[2]!='Amiibo'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Amiibo class#{"es" if [d,d2].max>1}"
      d=c2.reject{|q| q[2]!='Unavailable'}.length
      d2=c.reject{|q| q[2]!='Unavailable'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} enemy-exclusive class#{"es" if [d,d2].max>1}"
    end
    return nil
  elsif ['skill','skills','ability','abilities','abilitys'].include?(f.downcase)
    s=@skills.reject{|q| q[1]=='Gates'}
    s=@skills.map{|q| q} if k==256291408598663168
    s2=@skills.reject{|q| q[1]=='Gates'}
    event << "**There are #{numbers[5]} skills#{", or #{numbers[4]} with Penumbrans' included" if k==256291408598663168}.**"
    event << "This includes:"
    event << ''
    d=s2.map{|q| q[0]}.uniq.length
    d2=s.map{|q| q[0]}.uniq.length
    event << "#{d}#{" (#{d2})" unless d==d2} unique skills, based on name"
    event << ''
    d=s2.reject{|q| q[1]!='Fateswakening'}.length
    d2=s.reject{|q| q[1]!='Fateswakening'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} skills that behave identically in both *Awakening* and *Fates*"
    d=s2.reject{|q| q[1]!='Awakening'}.length
    d2=s.reject{|q| q[1]!='Awakening'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} skills with *Awakening* quirks"
    d=s2.reject{|q| q[1]!='Fates' && q[1]!='Gates'}.length
    d2=s.reject{|q| q[1]!='Fates' && q[1]!='Gates'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} skills with *Fates* quirks"
    d=s2.reject{|q| q[1]!='Three Houses'}.length
    d2=s.reject{|q| q[1]!='Three Houses'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} skills with *Three Houses* quirks"
    event << "~~\"Quirk\" refers to either game-specific mechanics or given to different classes in each game~~"
    if safe_to_spam?(event)
      event << ''
      d=s2.reject{|q| q[2]!='-' && q[2].map{|q2| q2[1].to_i<=0 || q2[1]=='mastery'}.include?(true)}.length
      d2=s.reject{|q| q[2]!='-' && q[2].map{|q2| q2[1].to_i<=0 || q2[1]=='mastery'}.include?(true)}.length
      event << "#{d}#{" (#{d2})" unless d==d2} skills learned via classes"
      d=s2.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[1]=='class'}.include?(true)}.length
      d2=s.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[1]=='class'}.include?(true)}.length
      event << "#{d}#{" (#{d2})" unless d==d2} class-specific skills"
      d=s2.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[1]=='personal'}.include?(true)}.length
      d2=s.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[1]=='personal'}.include?(true)}.length
      event << "#{d}#{" (#{d2})" unless d==d2} personal skills"
      d=s2.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[1]=='talent'}.include?(true)}.length
      d2=s.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[1]=='talent'}.include?(true)}.length
      event << "#{d}#{" (#{d2})" unless d==d2} skills obtained through Budding Talents"
      d=s2.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[1]=='skill'}.include?(true)}.length
      d2=s.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[1]=='skill'}.include?(true)}.length
      event << "#{d}#{" (#{d2})" unless d==d2} skills obtained through weapon experience"
      d=s2.reject{|q| q[2]!='-' && !q[2].map{|q2| ['Scroll','Manual'].include?(q2[0].split(' ')[-1])}.include?(true)}.length
      d2=s.reject{|q| q[2]!='-' && !q[2].map{|q2| ['Scroll','Manual'].include?(q2[0].split(' ')[-1])}.include?(true)}.length
      event << "#{d}#{" (#{d2})" unless d==d2} skills learned through manuals or scrolls"
      d=s2.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[0]=='Enemy exclusive'}.include?(true)}.length
      d2=s.reject{|q| q[2]!='-' && !q[2].map{|q2| q2[0]=='Enemy exclusive'}.include?(true)}.length
      event << "#{d}#{" (#{d2})" unless d==d2} enemy exclusive skills"
    end
    return nil
  elsif ['item','items','weapon','weapons'].include?(f.downcase)
    event << "**There are #{numbers[7]} items/weapons#{", or #{numbers[6]} with Penumbrans' included" if k==256291408598663168}.**"
    s=@items.reject{|q| q[1]=='Gates'}
    s=@items.map{|q| q} if k==256291408598663168
    s2=@items.reject{|q| q[1]=='Gates'}
    event << "This includes:"
    event << ''
    d=s2.map{|q| q[0]}.uniq.length
    d2=s.map{|q| q[0]}.uniq.length
    event << "#{d}#{" (#{d2})" unless d==d2} unique items/weapons, based on name"
    event << ''
    d=s2.reject{|q| q[1]!='Awakening'}.length
    d2=s.reject{|q| q[1]!='Awakening'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} items/weapons from *Awakening*"
    d=s2.reject{|q| q[1]!='Fates' && q[1]!='Gates'}.length
    d2=s.reject{|q| q[1]!='Fates' && q[1]!='Gates'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} items/weapons from *Fates*"
    d=s2.reject{|q| q[1]!='Three Houses'}.length
    d2=s.reject{|q| q[1]!='Three Houses'}.length
    event << "#{d}#{" (#{d2})" unless d==d2} items/weapons from *Three Houses*"
    if safe_to_spam?(event)
      event << ''
      d=s2.reject{|q| !['Sword','Katana'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Sword','Katana'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Swords/Katanas"
      d=s2.reject{|q| !['Lance','Naginata'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Lance','Naginata'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Lances/Naginatas"
      d=s2.reject{|q| !['Axe','Club'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Axe','Club'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Axes/Clubs"
      d=s2.reject{|q| !['Bow','Yumi'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Bow','Yumi'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Bows/Yumis"
      d=s2.reject{|q| !['Dagger','Shuriken'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Dagger','Shuriken'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Daggers/Shuriken"
      d=s2.reject{|q| !['Brawling'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Brawling'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} fist weapons"
      d=s2.reject{|q| !['Tome','Scroll','Black Magic','Dark Magic'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Tome','Scroll','Black Magic','Dark Magic'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Reason magicks"
      d=s2.reject{|q| !['Beaststone'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Beaststone'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Beaststones"
      d=s2.reject{|q| !['Dragonstone'].include?(q[2][0])}.length
      d2=s.reject{|q| !['Dragonstone'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Dragonstones"
      d=s2.reject{|q| q[1]=='Three Houses' || !['Staff','Rod'].include?(q[2][0])}.length+s2.reject{|q| q[2][0]!='White Magic'}.length
      d2=s.reject{|q| q[1]=='Three Houses' || !['Staff','Rod'].include?(q[2][0])}.length+s.reject{|q| q[2][0]!='White Magic'}.length
      event << "#{d}#{" (#{d2})" unless d==d2} Faith Magicks"
      d=s2.reject{|q| ['Staff','Rod','Dragonstone','Beaststone','Tome','Scroll','Dagger','Shuriken','Bow','Yumi','Axe','Club','Lance','Naginata','Sword','Katana','Brawling','Black Magic','Dark Magic','White Magic'].include?(q[2][0])}.length
      d2=s.reject{|q| ['Staff','Rod','Dragonstone','Beaststone','Tome','Scroll','Dagger','Shuriken','Bow','Yumi','Axe','Club','Lance','Naginata','Sword','Katana','Brawling','Black Magic','Dark Magic','White Magic'].include?(q[2][0])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} other weapons/items"
      event << ''
      d=s2.reject{|q| !['E'].include?(q[2][1])}.length
      d2=s.reject{|q| !['E'].include?(q[2][1])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} E-rank weapons"
      d=s2.reject{|q| !['D'].include?(q[2][1])}.length
      d2=s.reject{|q| !['D'].include?(q[2][1])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} D-rank weapons"
      d=s2.reject{|q| !['C'].include?(q[2][1])}.length
      d2=s.reject{|q| !['C'].include?(q[2][1])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} C-rank weapons"
      d=s2.reject{|q| !['B'].include?(q[2][1])}.length
      d2=s.reject{|q| !['B'].include?(q[2][1])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} B-rank weapons"
      d=s2.reject{|q| !['A'].include?(q[2][1])}.length
      d2=s.reject{|q| !['A'].include?(q[2][1])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} A-rank weapons"
      d=s2.reject{|q| !['S'].include?(q[2][1])}.length
      d2=s.reject{|q| !['S'].include?(q[2][1])}.length
      event << "#{d}#{" (#{d2})" unless d==d2} S-rank weapons"
    end
    event << ''
    d=s2.reject{|q| ![nil,''].include?(q[3])}.length
    d2=s.reject{|q| ![nil,''].include?(q[3])}.length
    event << "#{d}#{" (#{d2})" unless d==d2} regular weapons/items"
    d=s2.reject{|q| ['Enemy',nil,''].include?(q[3])}.length
    d2=s.reject{|q| ['Enemy',nil,''].include?(q[3])}.length
    event << "#{d}#{" (#{d2})" unless d==d2} Prf weapons/items"
    d=s2.reject{|q| !['Enemy'].include?(q[3])}.length
    d2=s.reject{|q| !['Enemy'].include?(q[3])}.length
    event << "#{d}#{" (#{d2})" unless d==d2} enemy-exclusive weapons/items"
    return nil
  elsif ['alias','aliases','name','names','nickname','nicknames'].include?(f.downcase)
    event.channel.send_temporary_message('Calculating data, please wait...',1)
    glbl=@names.reject{|q| q[0]!='Unit' || !q[3].nil?}.map{|q| [q[1],q[2]]}
    srv_spec=@names.reject{|q| q[0]!='Unit' || q[3].nil?}.map{|q| [q[1],q[2],q[3]]}
    all_units=@units.reject{|q| q[1][3]=='g'}
    all_units=@units.map{|q| q} if event.server.nil? && event.user.id==167657750971547648
    all_units=@units.map{|q| q} if !event.server.nil? && event.server.id==256291408598663168
    all_units=all_units.map{|q| [q[0],0,0]}
    legal_units=@units.reject{|q| q[1][3]=='g'}
    srv_spec=srv_spec.reject{|q| !all_units.map{|q| q[0]}.include?(q[1])}
    for j in 0...all_units.length
      all_units[j][1]+=glbl.reject{|q| q[1]!=all_units[j][0]}.length
      all_units[j][2]+=srv_spec.reject{|q| q[1]!=all_units[j][0]}.length
    end
    str="**There are #{longFormattedNumber(glbl.length)} global unit aliases.**"
    all_units=all_units.sort{|b,a| supersort(a,b,1).zero? ? supersort(a,b,0) : supersort(a,b,1)}
    k=all_units.reject{|q| q[1]!=all_units[0][1]}.map{|q| "*#{'~~' if legal_units.find_index{|q2| q2[0]==q[0]}.nil?}#{q[0]}#{'~~' if legal_units.find_index{|q2| q2[0]==q[0]}.nil?}*"}
    str="#{str}\nThe unit#{"s" unless k.length==1} with the most global aliases #{"is" if k.length==1}#{"are" unless k.length==1} #{list_lift(k,"and")}, with #{all_units[0][1]} global aliases#{" each" unless k.length==1}."
    k=all_units.reject{|q| q[1]!=0}.map{|q| "*#{'~~' if legal_units.find_index{|q2| q2[0]==q[0]}.nil?}#{q[0]}#{'~~' if legal_units.find_index{|q2| q2[0]==q[0]}.nil?}*"}
    if safe_to_spam?(event) || " #{event.message.text.downcase} ".include?(" all ")
      if k.length.zero?
        all_units=all_units.sort{|a,b| supersort(a,b,1).zero? ? supersort(b,a,0) : supersort(a,b,1)}
        k=all_units.reject{|q| q[1]!=all_units[0][1]}.map{|q| "*#{'~~' if legal_units.find_index{|q2| q2[0]==q[0]}.nil?}#{q[0]}#{'~~' if legal_units.find_index{|q2| q2[0]==q[0]}.nil?}*"}
        str="#{str}\nThe unit#{"s" unless k.length==1} with the fewest global aliases #{"is" if k.length==1}#{"are" unless k.length==1} #{list_lift(k,"and")}, with #{all_units[0][1]} global alias#{"es" unless all_units[0][1]==1}#{" each" unless k.length==1}."
      elsif event.server.nil? && event.user.id==167657750971547648
        if k.reject{|q| q.include?('~~')}.length.zero?
          str="#{str}\nThe following unit#{"s" unless k.length==1} have no global aliases: #{list_lift(k.map{|q| q.gsub('~~','')},"and")}"
        else
          str="#{str}\nThe following unit#{"s" unless k.reject{|q| q.include?('~~')}.length==1} have no global aliases: #{list_lift(k.reject{|q| q.include?('~~')},"and")}"
          str="#{str}\nThe following unit#{"s" unless k.reject{|q| !q.include?('~~')}.length==1} are fake: #{list_lift(k.reject{|q| !q.include?('~~')}.map{|q| q.gsub('~~','')},"and")}"
        end
      else
        str="#{str}\nThe following unit#{"s" unless k.length==1} have no global aliases: #{list_lift(k,"and")}"
      end
    end
    str2="**There are #{longFormattedNumber(srv_spec.length)} server-specific unit aliases.**"
    if event.server.nil? && @shardizard==4
      str2="#{str2}\nDue to being the debug version, I cannot show more information."
    elsif event.server.nil?
      str2="#{str2}\nServers you and I share account for #{@names.reject{|q| q[3].nil? || q[3].reject{|q2| q2==285663217261477889 || bot.user(event.user.id).on(q2).nil?}.length<=0}.length} of those."
    else
      str2="#{str2}\nThis server accounts for #{@names.reject{|q| q[3].nil? || !q[3].include?(event.server.id)}.length} of those."
    end
    all_units=all_units.sort{|b,a| supersort(a,b,2).zero? ? supersort(a,b,0) : supersort(a,b,2)}
    k=all_units.reject{|q| q[2]!=all_units[0][2]}.map{|q| "*#{'~~' if legal_units.find_index{|q2| q2[0]==q[0]}.nil?}#{q[0]}#{'~~' if legal_units.find_index{|q2| q2[0]==q[0]}.nil?}*"}
    k=k.uniq
    str2="#{str2}\nThe unit#{"s" unless k.length==1} with the most server-specific aliases #{"is" if k.length==1}#{"are" unless k.length==1} #{list_lift(k,"and")}, with #{all_units[0][2]} server-specific aliases#{" each" unless k.length==1}."
    for i in 0...srv_spec.length
      srv_spec[i][2]=srv_spec[i][2].length
    end
    srv_spec=srv_spec.sort{|b,a| supersort(a,b,2).zero? ? (supersort(a,b,1).zero? ? supersort(a,b,0) : supersort(a,b,1)) : supersort(a,b,2)}
    k=srv_spec.reject{|q| q[2]!=srv_spec[0][2]}.map{|q| "*#{q[0]} = #{q[1]}*"}
    str2="#{str2}\nThe most agreed-upon server-specific alias#{"es are" unless k.length==1}#{" is" if k.length==1} #{list_lift(k,"and")}.  #{srv_spec[0][2]} servers agree on #{"them" unless k.length==1}#{"it" if k.length==1}." if safe_to_spam?(event) || " #{event.message.text.downcase} ".include?(" all ")
    k=srv_spec.map{|q| q[2]}.inject(0){|sum,x| sum + x }
    str2="#{str2}\nCounting each alias/server combo as a unique alias, there are #{longFormattedNumber(k)} server-specific aliases"
    str=extend_message(str,str2,event,2)
    glbl=@names.reject{|q| q[0]!='Class' || !q[3].nil?}.map{|q| [q[1],q[2],q[3]]}
    srv_spec=@names.reject{|q| q[0]!='Class' || q[3].nil?}.map{|q| [q[1],q[2],q[3]]}
    str2="**There are #{longFormattedNumber(glbl.length)} global class aliases.**\n**There are #{longFormattedNumber(srv_spec.length)} server-specific class aliases.**"
    if event.server.nil? && @shardizard==4
    elsif event.server.nil?
      str2="#{str2} - Servers you and I share account for #{@names.reject{|q| q[0]!='Class' || q[3].nil? || q[3].reject{|q2| q2==285663217261477889 || bot.user(event.user.id).on(q2).nil?}.length<=0}.length} of those"
    else
      str2="#{str2} - This server accounts for #{@names.reject{|q| q[0]!='Class' || q[3].nil? || !q[3].include?(event.server.id)}.length} of those."
    end
    str=extend_message(str,str2,event,2)
    glbl=@names.reject{|q| q[0]!='Skill' || !q[3].nil?}.map{|q| [q[1],q[2],q[3]]}
    srv_spec=@names.reject{|q| q[0]!='Skill' || q[3].nil?}.map{|q| [q[1],q[2],q[3]]}
    str2="**There are #{longFormattedNumber(glbl.length)} global skill aliases.**\n**There are #{longFormattedNumber(srv_spec.length)} server-specific skill aliases.**"
    if event.server.nil? && @shardizard==4
    elsif event.server.nil?
      str2="#{str2} - Servers you and I share account for #{@names.reject{|q| q[0]!='Skill' || q[3].nil? || q[3].reject{|q2| q2==285663217261477889 || bot.user(event.user.id).on(q2).nil?}.length<=0}.length} of those"
    else
      str2="#{str2} - This server accounts for #{@names.reject{|q| q[0]!='Skill' || q[3].nil? || !q[3].include?(event.server.id)}.length} of those."
    end
    str=extend_message(str,str2,event,2)
    glbl=@names.reject{|q| q[0]!='Item' || !q[3].nil?}.map{|q| [q[1],q[2],q[3]]}
    srv_spec=@names.reject{|q| q[0]!='Item' || q[3].nil?}.map{|q| [q[1],q[2],q[3]]}
    str2="**There are #{longFormattedNumber(glbl.length)} global item/weapon aliases.**\n**There are #{longFormattedNumber(srv_spec.length)} server-specific item/weapon aliases.**"
    if event.server.nil? && @shardizard==4
    elsif event.server.nil?
      str2="#{str2} - Servers you and I share account for #{@names.reject{|q| q[0]!='Item' || q[3].nil? || q[3].reject{|q2| q2==285663217261477889 || bot.user(event.user.id).on(q2).nil?}.length<=0}.length} of those"
    else
      str2="#{str2} - This server accounts for #{@names.reject{|q| q[0]!='Item' || q[3].nil? || !q[3].include?(event.server.id)}.length} of those."
    end
    str=extend_message(str,str2,event,2)
    event.respond str
    return nil
  elsif ['code','lines','line','sloc'].include?(f.downcase)
    event.channel.send_temporary_message('Calculating data, please wait...',3)
    b=[[],[],[],[],[]]
    File.open("C:/Users/#{@mash}/Desktop/devkit/RobinBot.rb").each_line do |line|
      l=line.gsub("\n",'')
      b[0].push(l)
      b[3].push(l)
      l=line.gsub("\n",'').gsub(' ','')
      b[1].push(l) unless l.length<=0
    end
    File.open("C:/Users/#{@mash}/Desktop/devkit/rot8er_functs.rb").each_line do |line|
      l=line.gsub("\n",'')
      b[0].push(l)
      b[4].push(l)
      l=line.gsub("\n",'').gsub(' ','')
      b[2].push(l) unless l.length<=0
    end
    event << "**I am #{longFormattedNumber(File.foreach("C:/Users/#{@mash}/Desktop/devkit/RobinBot.rb").inject(0) {|c, line| c+1})} lines of code long.**"
    event << "Of those, #{longFormattedNumber(b[1].length)} are SLOC (non-empty)."
    event << "~~When fully collapsed, I appear to be #{longFormattedNumber(b[3].reject{|q| q.length>0 && (q[0,2]=='  ' || q[0,3]=='end' || q[0,4]=='else')}.length)} lines of code long.~~"
    event << ''
    event << "**I rely on a library that is #{longFormattedNumber(File.foreach("C:/Users/#{@mash}/Desktop/devkit/rot8er_functs.rb").inject(0) {|c, line| c+1})} lines of code long.**"
    event << "Of those, #{longFormattedNumber(b[2].length)} are SLOC (non-empty)."
    event << "~~When fully collapsed, it appears to be #{longFormattedNumber(b[4].reject{|q| q.length>0 && (q[0,2]=='  ' || q[0,3]=='end' || q[0,4]=='else')}.length)} lines of code long.~~"
    event << ''
    event << "**There are #{longFormattedNumber(b[0].reject{|q| q[0,12]!='bot.command('}.length)} commands, invoked with #{longFormattedNumber(all_commands().length)} different phrases.**"
    event << 'This includes:'
    event << "#{longFormattedNumber(b[0].reject{|q| q[0,12]!='bot.command(' || q.include?('from: 167657750971547648')}.length-b[0].reject{|q| q.gsub('  ','')!='event.respond "You are not a mod."' && q.gsub('  ','')!="str='You are not a mod.'"}.length)} global commands, invoked with #{longFormattedNumber(all_commands(false,0).length)} different phrases."
    event << "#{longFormattedNumber(b[0].reject{|q| q.gsub('  ','')!='event.respond "You are not a mod."' && q.gsub('  ','')!="str='You are not a mod.'"}.length)} mod-only commands, invoked with #{longFormattedNumber(all_commands(false,1).length)} different phrases."
    event << "#{longFormattedNumber(b[0].reject{|q| q[0,12]!='bot.command(' || !q.include?('from: 167657750971547648')}.length)} dev-only commands, invoked with #{longFormattedNumber(all_commands(false,2).length)} different phrases."
    event << ''
    event << "**There are #{longFormattedNumber(b[0].reject{|q| q[0,4]!='def '}.length)} functions the commands use.**"
    if safe_to_spam?(event) || " #{event.message.text.downcase} ".include?(" all ")
      b=b[0].map{|q| q.gsub('  ','')}.reject{|q| q.length<=0}
      for i in 0...b.length
        b[i]=b[i][1,b[i].length-1] if b[i][0,1]==' '
      end
      event << ''
      event << 'There are:'
      event << "#{longFormattedNumber(b.reject{|q| q[0,4]!='for '}.length)} `for` loops."
      event << "#{longFormattedNumber(b.reject{|q| q[0,6]!='while '}.length)} `while` loops."
      event << "#{longFormattedNumber(b.reject{|q| q[0,3]!='if '}.length)} `if` trees, along with #{longFormattedNumber(b.reject{|q| q[0,6]!='elsif '}.length)} `elsif` branches and #{longFormattedNumber(b.reject{|q| q[0,4]!='else'}.length)} `else` branches."
      event << "#{longFormattedNumber(b.reject{|q| q[0,7]!='unless '}.length)} `unless` trees."
      event << "#{longFormattedNumber(b.reject{|q| count_in(q,'[')<=count_in(q,']')}.length)} multi-line arrays."
      event << "#{longFormattedNumber(b.reject{|q| count_in(q,'{')<=count_in(q,'}')}.length)} multi-line hashes."
      event << "#{longFormattedNumber(b.reject{|q| q[0,3]=='if ' || !remove_format(remove_format(q,"'"),'"').include?(' if ')}.length)} single-line `if` conditionals."
      event << "#{longFormattedNumber(b.reject{|q| q[0,7]=='unless ' || !remove_format(remove_format(q,"'"),'"').include?(' unless ')}.length)} single-line `unless` conditionals."
      event << "#{longFormattedNumber(b.reject{|q| q[0,7]!='return '}.length)} `return` lines."
    end
    return nil
  elsif f.to_i.to_s==f && event.user.id==167657750971547648
    srv=(bot.server(f.to_i) rescue nil)
    if srv.nil? || bot.user(bot.profile.id).on(srv.id).nil?
      s2="I am not in that server."
    else
      s2="__**#{srv.name}** (#{srv.id})__\n*Owner:* #{srv.owner.distinct} (#{srv.owner.id})\n*Shard:* #{(srv.id >> 22) % 4}\n*My nickname:* #{bot.user(bot.profile.id).on(srv.id).display_name}"
    end
    event.respond s2
    return nil
  end
  bot.servers.values(&:members)
  event << "**I am in #{longFormattedNumber(@server_data2[0].inject(0){|sum,x| sum + x })} *servers*, reaching #{longFormattedNumber(@server_data2[1].inject(0){|sum,x| sum + x })} unique members.**"
  event << "This shard is in #{longFormattedNumber(@server_data2[0][@shardizard])} servers, reaching #{longFormattedNumber(@server_data2[1][@shardizard])} unique members."
  event << ''
  event << "There are #{numbers[1]} *units*#{", or #{numbers[0]} with Penumbrans included" if k==256291408598663168}."
  event << "There are #{numbers[3]} *classes*#{", or #{numbers[2]} with Penumbra-exclusives included" if k==256291408598663168}."
  event << "There are #{numbers[5]} *skills*#{", or #{numbers[4]} with Penumbrans' included" if k==256291408598663168}."
  event << "There are #{numbers[7]} *items*#{", or #{numbers[6]} with Penumbrans' included" if k==256291408598663168}."
  event << ''
  event << "There are #{longFormattedNumber(@names.reject{|q| !q[3].nil?}.length)} global and #{longFormattedNumber(@names.reject{|q| q[3].nil?}.length)} server-specific *aliases*"
  event << ''
  event << "I am #{longFormattedNumber(File.foreach("C:/Users/#{@mash}/Desktop/devkit/RobinBot.rb").inject(0) {|c, line| c+1})} lines of *code* long."
  event << "Of those, #{longFormattedNumber(b.length)} are SLOC (non-empty)."
  return nil
end

bot.command([:shard,:alliance]) do |event, i|
  return nil if overlap_prevent(event)
  if i.to_i.to_s==i && i.to_i.is_a?(Bignum) && @shardizard != 4
    srv=(bot.server(i.to_i) rescue nil)
    if srv.nil? || bot.user(304652483299377182).on(srv.id).nil?
      event.respond "I am not in that server, but it would be in the #{['Plegian/Vallite','Ylissian/Hoshidan','Valmese/Nohrian'][(i.to_i >> 22) % 3]} Alliance."
    else
      event.respond "#{srv.name} is in the #{['Plegian/Vallite','Ylissian/Hoshidan','Valmese/Nohrian'][(i.to_i >> 22) % 3]} Alliance."
    end
    return nil
  end
  event.respond "This is the debug mode, which uses Golden Shards." if @shardizard==4
  event.respond "PMs always are a part of the Plegian/Vallite Alliance." if event.server.nil?
  event.respond "This server is in the #{['Plegian/Vallite','Ylissian/Hoshidan','Valmese/Nohrian'][(event.server.id >> 22) % 3]} Alliance." unless event.server.nil? || @shardizard==4
end

bot.command([:safe,:spam,:safetospam,:safe2spam,:long,:longreplies]) do |event, f|
  return nil if overlap_prevent(event)
  f='' if f.nil?
  metadata_load()
  if event.server.nil?
    event.respond 'It is safe for me to send long replies here because this is my PMs with you.'
  elsif [443172595580534784,443181099494146068,443704357335203840,449988713330769920,497429938471829504,554231720698707979,523821178670940170,523830882453422120,691616574393811004,523824424437415946,523825319916994564,523822789308841985,532083509083373579,575426885048336388].include?(event.server.id)
    event.respond 'It is safe for me to send long replies here because this is one of my emoji servers.'
  elsif @shardizard==4
    event.respond 'It is safe for me to send long replies here because this is my debug mode.'
  elsif ['bots','bot'].include?(event.channel.name.downcase)
    event.respond "It is safe for me to send long replies here because the channel is named `#{event.channel.name.downcase}`."
  elsif event.channel.name.downcase.include?('bot') && event.channel.name.downcase.include?('spam')
    event.respond 'It is safe for me to send long replies here because the channel name includes both the word "bot" and the word "spam".'
  elsif event.channel.name.downcase.include?('bot') && event.channel.name.downcase.include?('command')
    event.respond 'It is safe for me to send long replies here because the channel name includes both the word "bot" and the word "command".'
  elsif event.channel.name.downcase.include?('bot') && event.channel.name.downcase.include?('channel')
    event.respond 'It is safe for me to send long replies here because the channel name includes both the word "bot" and the word "channel".'
  elsif event.channel.name.downcase.include?('robinbot') || event.channel.name.downcase.include?('robin-bot') || event.channel.name.downcase.include?('robin_bot') || event.channel.name.downcase.include?('feindex') || event.channel.name.downcase.include?('fe-index') || event.channel.name.downcase.include?('fe_index')
    event.respond 'It is safe for me to send long replies here because the channel name specifically calls attention to the fact that it is made for me.'
  elsif @spam_channels.include?(event.channel.id)
    if is_mod?(event.user,event.server,event.channel) && ['off','no','false'].include?(f.downcase)
      metadata_load()
      @spam_channels.delete(event.channel.id)
      metadata_save()
      event.respond 'This channel is no longer marked as safe for me to send long replies to.'
    else
      event << 'This channel has been specifically designated for me to be safe to send long replies to.'
      event << 'If you wish to turn them off, ask a server mod to type `DL!spam off` in this channel.'
    end
  elsif is_mod?(event.user,event.server,event.channel,1) && ['on','yes','true'].include?(f.downcase)
    metadata_load()
    @spam_channels.push(event.channel.id)
    metadata_save()
    event.respond 'This channel is now marked as safe for me to send long replies to.'
  else
    event << 'It is not safe for me to send long replies here.'
    event << ''
    event << 'If you wish to change that, try one of the following:'
    event << '- Change the channel name to "bots".'
    event << '- Change the channel name to include the word "bot" and one of the following words: "spam", "command(s)", "channel".'
    event << '- Have a server mod type `DL!spam on` in this channel.'
  end
end

bot.command([:channellist,:chanelist,:spamchannels,:spamlist]) do |event|
  return nil if overlap_prevent(event)
  if event.server.nil?
    event.respond "Yes, it is safe to spam here."
    return nil
  end
  sfe=[[],[]]
  for i in 0...event.server.channels.length
    chn=event.server.channels[i]
    if safe_to_spam?(event,chn)
      sfe[0].push(chn.mention)
    end
  end
  event << '__**All long replies are safe**__'
  event << sfe[0].join("\n")
  event << 'In PM with any user'
end

bot.command(:sendpm, from: 167657750971547648) do |event, user_id, *args| # sends a PM to a specific user
  return nil if overlap_prevent(event)
  dev_pm(bot,event,user_id)
end

bot.command(:ignoreuser, from: 167657750971547648) do |event, user_id| # causes Robin to ignore the specified user
  return nil if overlap_prevent(event)
  bliss_mode(bot,event,user_id)
end

bot.command(:sendmessage, from: 167657750971547648) do |event, channel_id, *args| # sends a message to a specific channel
  return nil if overlap_prevent(event)
  dev_message(bot,event,channel_id)
end

bot.command(:leaveserver, from: 167657750971547648) do |event, server_id| # forces Robin to leave a server
  return nil if overlap_prevent(event)
  walk_away(bot,event,server_id)
end

bot.command([:donation, :donate]) do |event, uid|
  return nil if overlap_prevent(event)
  uid="#{event.user.id}" if uid.nil? || uid.length.zero?
  if /<@!?(?:\d+)>/ =~ uid
    uid=event.message.mentions[0].id
  else
    uid=uid.to_i
    uid=event.user.id if uid==0
  end
  g=get_donor_list()
  if uid==167657750971547648
    n=["#{bot.user(uid).distinct} is","He"]
    n=["You are","You"] if uid==event.user.id
    create_embed(event,"#{n[0]} my developer.","#{n[1]} can have whatever permissions #{n[1].downcase} want#{'s' unless uid==event.user.id} to have.",0x00DAFA)
  elsif g.map{|q| q[0]}.include?(uid)
    n="#{bot.user(uid).distinct} is"
    n="You are" if uid==event.user.id
    g=g[g.find_index{|q| q[0]==uid}]
    str=""
    n4=bot.user(uid).name
    n4=n4[0,[3,n4.length].min]
    n4=" #{n4}" if n4.length<2
    n2=n4.downcase
    n3=[]
    for i in 0...n2.length
      if "abcdefghijklmnopqrstuvwxyz".include?(n2[i])
        n3.push(9*("abcdefghijklmnopqrstuvwxyz".split(n2[i])[0].length)+25)
        n3[i]+=5 if n4[i]!=n2[i]
      elsif n2[i].to_i.to_s==n2[i]
        n3.push(n2[i].to_i*2+1)
      else
        n3.push(0)
      end
    end
    color=n3[0]*256*256+n3[1]*256+n3[2]
    str="**Tier 1:** Access to the donor-exclusive channel in my debug server.\n\u2713 This perk cannot be checked dynamically.\nYou can check if it was given to you by clicking this channel link: <#590642838497394689>" if g[2].max>=1
    str="#{str}\n\n**Tier 2:** Ability to give server-specific aliases in any server\n\u2713 Given" if g[2].max>=2
    if g[2][2]>=3
      if g[3].nil? || g[3].length.zero? || g[4].nil? || g[4].length.zero?
        str="#{str}\n\n**Tier 3:** Birthday avatar\n\u2717 Not given.  Please contact <@167657750971547648> to have this corrected."
      elsif g[4][3]=='-'
        str="#{str}\n\n**Tier 3:** Birthday avatar\n\u2713 May be given via another bot."
      elsif !File.exist?("C:/Users/#{@mash}/Desktop/devkit/EliseImages/#{g[4][3]}.png")
        str="#{str}\n\n**Tier 3:** Birthday avatar\n\u2717 Not given.  Please contact <@167657750971547648> to have this corrected.\n*Birthday:* #{g[3][1]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][g[3][0]]}\n*Character:* #{g[4][3]}"
      else
        str="#{str}\n\n**Tier 3:** Birthday avatar\n\u2713 Given\n*Birthday:* #{g[3][1]} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][g[3][0]]}\n*Character:* #{g[4][3]}"
      end
    end
    create_embed(event,"__**#{n} a Tier #{g[2][3]} donor.**__",str,color)
  end
  donor_embed(bot,event)
end

bot.command([:status, :avatar, :avvie]) do |event, *args|
  return nil if overlap_prevent(event)
  t=Time.now
  timeshift=6
  t-=60*60*timeshift
  if event.user.id==167657750971547648 && !args.nil? && args.length>0 # only work when used by the developer
    bot.game=args.join(' ')
    event.respond 'Status set.'
    return nil
  end
  if @embedless.include?(event.user.id) || was_embedless_mentioned?(event)
    event << "Current avatar: #{bot.user(304652483299377182).avatar_url}"
    event << "Unit in avatar: #{@avvie_info[0]}"
    event << ''
    event << "Current status:"
    event << "[Playing] #{@avvie_info[1]}"
    event << ''
    event << "Reason: #{@avvie_info[2]}" unless @avvie_info[2].length.zero?
    event << ''
    event << "Dev's timezone: #{t.day} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][t.month]} #{t.year} (a #{['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'][t.wday]}) | #{'0' if t.hour<10}#{t.hour}:#{'0' if t.min<10}#{t.min}"
  else
    create_embed(event,'',"Unit in avatar: #{@avvie_info[0]}\n\nCurrent status:\n[Playing] #{@avvie_info[1]}#{"\n\nReason: #{@avvie_info[2]}" unless @avvie_info[2].length.zero?}\n\n[For a full calendar of avatars, click here](https://docs.google.com/spreadsheets/d/1j-tdpotMO_DcppRLNnT8DN8Ftau-rdQ-ZmZh5rZkZP0/edit?usp=sharing)",(t.day*7+t.month*21*256+(t.year-2000)*10*256*256),"Dev's timezone: #{t.day} #{['','January','February','March','April','May','June','July','August','September','October','November','December'][t.month]} #{t.year} (a #{['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday'][t.wday]}) | #{'0' if t.hour<10}#{t.hour}:#{'0' if t.min<10}#{t.min}",bot.user(304652483299377182).avatar_url)
  end
  return nil
end

bot.command([:boop]) do |event|
  data_load()
  x=@skills.map{|q| q}
  y=@classes.map{|q| q}
  y2=@units.map{|q| q}
  event.respond x.reject{|q| !y.map{|q2| q2[0]}.include?(q[0]) && !y2.map{|q2| q2[0]}.include?(q[0])}.map{|q| "**#{q[0]}** - #{q[1]}"}.join("\n")
end

bot.server_create do |event|
  chn=event.server.general_channel
  if chn.nil?
    chnn=[]
    for i in 0...event.server.channels.length
      chnn.push(event.server.channels[i]) if bot.user(bot.profile.id).on(event.server.id).permission?(:send_messages,event.server.channels[i])
    end
    chn=chnn[0] if chnn.length>0
  end
  if ![285663217261477889,443172595580534784,443181099494146068,443704357335203840,497429938471829504,554231720698707979,523821178670940170,523830882453422120,691616574393811004,523824424437415946,523825319916994564,523822789308841985,532083509083373579,575426885048336388,572792502159933440].include?(event.server.id) && @shardizard==4
    (chn.send_message(get_debug_leave_message()) rescue nil)
    event.server.leave
  else
    bot.user(167657750971547648).pm("Joined server **#{event.server.name}** (#{event.server.id})\nOwner: #{event.server.owner.distinct} (#{event.server.owner.id})\nAssigned to the #{['Plegian/Vallite','Ylissian/Hoshidan','Valmese/Nohrian'][(event.server.id >> 22) % 3]} Alliance")
    @server_data2[0][(event.server.id >> 22) % 3]+=1
    chn.send_message("Grr, where have I been woken up this time?") rescue nil
  end
end

bot.server_delete do |event|
  bot.user(167657750971547648).pm("Left server **#{event.server.name}**\nThis server was part of the #{['Plegian/Vallite','Ylissian/Hoshidan','Valmese/Nohrian'][((event.server.id >> 22) % @shards)]} Alliance")
  metadata_load()
  @server_data2[0][((event.server.id >> 22) % 3)] -= 1
  metadata_save()
end

bot.message do |event|
  str=event.message.text.downcase
  if overlap_prevent(event)
  elsif (['feh!','feh?'].include?(str[0,4]) || ['f?','e?','h?'].include?(str[0,2])) && @shardizard==4 && (event.server.nil? || event.server.id==285663217261477889)
    s=event.message.text.downcase
    s=s[2,s.length-2] if ['f?','e?','h?'].include?(event.message.text.downcase[0,2])
    s=s[4,s.length-4] if ['feh!','feh?'].include?(event.message.text.downcase[0,4])
    a=s.split(' ')
    if a[0].downcase=='reboot'
      event.respond "Becoming Elise.  Please wait approximately ten seconds..."
      exec "cd C:/Users/#{@mash}/Desktop/devkit && PriscillaBot.rb 4"
    elsif event.server.nil? || event.server.id==285663217261477889
      event.respond "I am not Elise right now.  Please use `FEH!reboot` to turn me into Elise."
    end
  elsif (['fgo!','fgo?','liz!','liz?'].include?(str[0,4]) || ['fate!','fate?'].include?(str[0,5])) && @shardizard==4 && (event.server.nil? || event.server.id==285663217261477889)
    s=event.message.text.downcase
    s=s[5,s.length-5] if ['fate!','fate?'].include?(event.message.text.downcase[0,5])
    s=s[4,s.length-4] if ['fgo!','fgo?','liz!','liz?'].include?(event.message.text.downcase[0,4])
    a=s.split(' ')
    if a[0].downcase=='reboot'
      event.respond "Becoming Liz.  Please wait approximately ten seconds..."
      exec "cd C:/Users/#{@mash}/Desktop/devkit && LizBot.rb 4"
    elsif event.server.nil? || event.server.id==285663217261477889
      event.respond "I am not Liz right now.  Please use `FGO!reboot` to turn me into Liz."
    end
  elsif ['dl!','dl?'].include?(str[0,3]) && @shardizard==4 && (event.server.nil? || event.server.id==285663217261477889)
    s=event.message.text.downcase
    s=s[3,s.length-3]
    a=s.split(' ')
    if a[0].downcase=='reboot'
      event.respond "Becoming Botan.  Please wait approximately ten seconds..."
      exec "cd C:/Users/#{@mash}/Desktop/devkit && BotanBot.rb 4"
    elsif event.server.nil? || event.server.id==285663217261477889
      event.respond "I am not Botan right now.  Please use `DL!reboot` to turn me into Botan."
    end
  elsif (['!weak '].include?(str[0,6]) || ['!weakness '].include?(str[0,10]))
    if event.server.nil? || event.server.id==264445053596991498
    elsif !bot.user(206147275775279104).on(event.server.id).nil? || @shardizard==4 || event.server.id==330850148261298176 # Pokedex
      triple_weakness(bot,event)
    end
  elsif ['fea!','fef!','fea?','fef?'].include?(str[0,4]) || ['fe13!','fe14!','fe16!','fe13?','fe14?','fe16?','fe3h!','fe3h?','feth!','feth?'].include?(str[0,5]) || ['fe!','fe?','3h!','3h?'].include?(str[0,3]) || (!event.server.nil? && !@prefixes[event.server.id].nil? && @prefixes[event.server.id].length>0 && @prefixes[event.server.id].downcase==event.message.text.downcase[0,@prefixes[event.server.id].length])
    str=str[4,str.length-4] if ['fea!','fef!','fea?','fef?'].include?(str[0,4])
    str=str[5,str.length-5] if ['fe13!','fe14!','fe13?','fe14?'].include?(str[0,5])
    str=str[3,str.length-3] if ['fe!','fe?','3h!','3h?'].include?(str[0,3])
    str=str[@prefixes[event.server.id].length,str.length-@prefixes[event.server.id].length] if (!event.server.nil? && !@prefixes[event.server.id].nil? && @prefixes[event.server.id].length>0 && @prefixes[event.server.id].downcase==event.message.text.downcase[0,@prefixes[event.server.id].length])
    args=str.split(' ')
    puts event.message.text
    unless all_commands().include?(args[0])
      game=game_proc(event)
      m=-1
      a=args.reject{|q| !find_unit(game,q,event,true).nil? || !find_class(q,event,game).nil?}
      m=parse_job(event,args,bot,1) unless (!find_skill(game,args.join(' '),event,true,true).nil? && (find_skill(game,args.join(' '),event,true,true)[0]!='Aptitude' || a.length==args.length)) || !find_item(game,args.join(' '),event,true,true).nil?
      if m<0
        if !find_skill(game,args.join(' '),event,true).nil?
          skill_parse(event,bot,args)
        elsif !find_item(game,args.join(' '),event,true).nil?
          item_parse(event,bot,args,1)
        elsif !find_crest(args.join(' '),event,true).nil?
          crest_parse(bot,event,args)
        elsif !find_combat_art(args.join(' '),event,true).nil?
          combat_art_parse(bot,event,args)
        elsif !find_skill(game,args.join(' '),event).nil?
          skill_parse(event,bot,args)
        elsif !find_item(game,args.join(' '),event).nil?
          item_parse(event,bot,args,1)
        elsif !find_crest(args.join(' '),event).nil?
          crest_parse(bot,event,args)
        elsif !find_combat_art(args.join(' '),event).nil?
          combat_art_parse(bot,event,args)
        end
      end
    end
  elsif !event.server.nil? && (above_memes().include?("s#{event.server.id}") || above_memes().include?(event.server.id))
  elsif !event.channel.nil? && above_memes().include?("c#{event.channel.id}")
  elsif above_memes().include?("u#{event.user.id}") || above_memes().include?(event.user.id)
  elsif event.message.text.include?('0x4') && !event.user.bot_account? && @shardizard==4
    s=event.message.text
    s=remove_format(s,'```')              # remove large code blocks
    s=remove_format(s,'`')                # remove small code blocks
    s=remove_format(s,'~~')               # remove crossed-out text
    s=remove_format(s,'||')               # remove spoiler tags
    if s=='0x4' || s[0,4]=='0x4 ' || s[s.length-4,4]==' 0x4' || s.include?(' 0x4 ')
      event.respond "#{"#{event.user.mention} " unless event.server.nil?}I am not Elise right now, but I have responded in case you're checking my response time."
    end
  end
end

bot.mention do |event|
  str=event.message.text.downcase
  args=str.split(' ')
  puts event.message.text
  args=args.reject{ |a| a.match(/<@!?(?:\d+)>/) }
  game=""
  m=-1
  m=1 if event.user.bot_account?
  if ['help','commands','command_list','commandlist'].include?(args[0].downcase)
    args.shift
    help_text(event,bot,args[0],args[1])
    m=1
  elsif ['birthday','bday'].include?(args[0].downcase)
    args.shift
    bday_text(event,bot)
    m=1
  elsif ['levelup','level'].include?(args[0].downcase)
    args.shift
    levelup_unit(bot,event,args)
    m=1
  elsif ['crest'].include?(args[0].downcase)
    args.shift
    crest_parse(bot,event,args)
    m=1
  elsif ['combat','art','arts','combatart','combatarts'].include?(args[0].downcase)
    args.shift
    combat_art_parse(bot,event,args)
    m=1
  elsif ['marry','marriage','support'].include?(args[0].downcase)
    args.shift
    marry_units(bot,event,args[0],args[1])
    m=1
  elsif ['unit','character','chara','char'].include?(args[0].downcase)
    args.shift
    unit_parse(event,bot,args)
    m=1
  elsif ['class'].include?(args[0].downcase)
    args.shift
    class_parse(event,bot,args)
    m=1
  elsif ['data','job'].include?(args[0].downcase)
    args.shift
    parse_job(event,args,bot,0)
    m=1
  elsif ['item','weapon'].include?(args[0].downcase)
    args.shift
    item_parse(event,bot,args)
    m=1
  elsif ['skill','ability','abil'].include?(args[0].downcase)
    args.shift
    skill_parse(event,bot,args)
    m=1
  elsif ['find','search','sort','list'].include?(args[0].downcase)
    args.shift
    get_unit_list(event,bot,args)
    m=1
  end
  if m<0
    a=args.reject{|q| !find_unit(game,q,event,true).nil? || !find_class(q,event,game,true).nil?}
    m=parse_job(event,args,bot,1) unless (!find_skill(game,args.join(' '),event,true).nil? && (find_skill(game,args.join(' '),event,true)[0]!='Aptitude' || a.length==args.length)) || !find_item(game,args.join(' '),event,true).nil?
    if m<0
      if !find_skill(game,args.join(' '),event,true).nil?
        skill_parse(event,bot,args)
      elsif !find_item(game,args.join(' '),event,true).nil?
        item_parse(event,bot,args,1)
      elsif !find_crest(args.join(' '),event,true).nil?
        crest_parse(bot,event,args)
      elsif !find_combat_art(args.join(' '),event,true).nil?
        combat_art_parse(bot,event,args)
      elsif !find_skill(game,args.join(' '),event).nil?
        skill_parse(event,bot,args)
      elsif !find_item(game,args.join(' '),event).nil?
        item_parse(event,bot,args,1)
      elsif !find_crest(args.join(' '),event).nil?
        crest_parse(bot,event,args)
      elsif !find_combat_art(args.join(' '),event).nil?
        combat_art_parse(bot,event,args)
      end
    end
  end
end

def next_birthday(bot,mode=0)
  return nil unless [1,4].include?(@shardizard)
  chn=@bday_channels.values
  chn=[285663217261477889] if @shardizard==4
  untz=bday_order(bot)
  t=Time.now
  return nil if t.year==2020 && t.month==4 && t.day==1 && @shardizard != 4
  untz=untz.reject{|q| q[0]!=t.year || q[1]!=t.month || q[2]!=t.day}
  m=0
  if t.hour<10
    m=1
  elsif (t-@last_bday).to_f<23*60*60
  elsif untz.length>0
    @last_bday=t
    for i in 0...chn.length
      bot.channel(chn[i]).send_message("__Today's *Fire Emblem* birthdays__\n#{untz.map{|q| "**#{q[3]}** from *#{q[4]}*#{" - #{t.year-q[5]} years old" unless q[5].nil?}"}.join("\n")}")
    end
  end
  t+=(1-m)*24*60*60
  @scheduler.at "#{t.year}/#{t.month}/#{t.day} 1000" do
    next_birthday(bot)
  end
end

def next_holiday(bot,mode=0)
  t=Time.now
  t-=60*60*6
  holidays=[[0,4,1,'RobinBot(M)',"pranks on you."]]
  d=get_donor_list().reject{|q| q[2][3]<3 || q[4][3]=='-'}
  for i in 0...d.length
    if d[i][4][3]!='-'
      holidays.push([0,d[i][3][0],d[i][3][1],d[i][4][3],"in recognition of #{bot.user(d[i][0]).distinct}","Donator's birthday"])
      holidays[-1][5]="Donator's Day" if d[i][0]==189235935563481088
    end
  end
  for i in 0...holidays.length
    if t.month>holidays[i][1] || (t.month==holidays[i][1] && t.day>holidays[i][2])
      holidays[i][0]=t.year+1
    else
      holidays[i][0]=t.year
    end
  end
  e=calc_easter()
 # holidays.push([e[0],e[1],e[2],'','','Easter'])
  t=Time.now
  t-=60*60*6
  y8=t.year
  j8=Time.new(y8,6,8)
  fsij=8-j8.wday
  fsij-=7 if j8.sunday?
  fd=fsij+14
  if (t.month==6 && t.day>fd) || t.month>6
    y8+=1
    j8=Time.new(y8,6,8)
    fsij=8-j8.wday
    fsij-=7 if j8.sunday?
    fd=fsij+14
  end
 # holidays.push([y8,6,fd,'','',"Father's Day"])
  t=Time.now
  t-=60*60*6
  y8=t.year
  m8=Time.new(y8,5,8)
  fsim=8-m8.wday
  fsim-=7 if m8.sunday?
  md=fsim+7
  if (t.month==5 && t.day>md) || t.month>5
    y8+=1
    m8=Time.new(y8,5,8)
    fsim=8-m8.wday
    fsim-=7 if m8.sunday?
    md=fsim+14
  end
 # holidays.push([y8,5,md,'','',"Mother's Day"])
  holidays.sort! {|a,b| supersort(a,b,0) == 0 ? (supersort(a,b,1) == 0 ? (supersort(a,b,2) == 0 ? (supersort(a,b,6) == 0 ? supersort(a,b,4) : supersort(a,b,6)) : supersort(a,b,2)) : supersort(a,b,1)) : supersort(a,b,0)}
  k=[]
  for i in 0...holidays.length
    k.push(holidays[i]) if holidays[i][0]==holidays[0][0] && holidays[i][1]==holidays[0][1] && holidays[i][2]==holidays[0][2]
  end
  div=[[],
       [[0,0]],
       [[0,0],[12,0]],
       [[0,0],[8,0],[16,0]],
       [[0,0],[6,0],[12,0],[18,0]],
       [[0,0],[4,48],[9,36],[14,24],[19,12]],
       [[0,0],[4,0],[8,0],[12,0],[16,0],[20,0]],
       [[0,0],[3,26],[6,52],[10,17],[13,43],[17,8],[18,34]],
       [[0,0],[3,0],[6,0],[9,0],[12,0],[15,0],[18,0],[21,0]]]
  t=Time.now
  t-=60*60*6
  if k.length<=0
    t=Time.now
    t-=60*60*6
    bot.game='Awakening/Fates (FE!help for info)'
    bot.profile.avatar=(File.open("C:/Users/#{@mash}/Desktop/devkit/RobinBot.png",'r')) rescue nil if @shardizard.zero?
    @avvie_info=['Robin','*Fire Emblem Awakening/Fates*','']
    t+=24*60*60
    @scheduler.at "#{t.year}/#{t.month}/#{t.day} 0000" do
      next_holiday(bot,1)
    end
  elsif t.year==k[0][0] && t.month==k[0][1] && t.day==k[0][2]
    if k.length==1
      # Only one holiday is today.  Display new avatar, and set another check for midnight
      bot.game=k[0][4]
      if @shardizard.zero?
        bot.profile.avatar=(File.open("C:/Users/#{@mash}/Desktop/devkit/EliseImages/#{k[0][3]}.png",'r')) rescue nil
      end
      @avvie_info=[k[0][3],k[0][4],k[0][5]]
      t2= Time.now + 18*60*60
      t=Time.now
      @scheduler.at "#{t2.year}/#{t2.month}/#{t2.day} 0000" do
        next_holiday(bot,1)
      end
    else
      # multiple holidays are today.  Change avatar based on time of day, using div as a reference
      fcod=div[k.length][k.length-1]
      if t.hour>fcod[0] || (t.hour==fcod[0] && t.min>=fcod[1])
        # in last area of day.  Set avatar to the last one for the day, then set a check for tomorrow at midnight
        bot.game=k[k.length-1][4]
        if @shardizard.zero?
          bot.profile.avatar=(File.open("C:/Users/#{@mash}/Desktop/devkit/RobinImages/#{k[k.length-1][3]}.png",'r')) rescue nil
        end
        @avvie_info=[k[k.length-1][3],k[k.length-1][4],k[k.length-1][5]]
        t2= Time.now + 18*60*60
        t=Time.now
        @scheduler.at "#{t2.year}/#{t2.month}/#{t2.day} 0000" do
          next_holiday(bot,1)
        end
      else
        # find when in the day it is and...
        j=0
        t=Time.now
        t-=60*60*6
        for i in 0...div[k.length].length-1
          j=i if t.hour<div[k.length][i+1][0] || (t.hour==div[k.length][i+1][0] && t.min<div[k.length][i+1][1])
        end
        # ...set avatar properly and set check for the beginning of the next chunk of the day
        bot.game=k[j][4]
        if @shardizard.zero?
          bot.profile.avatar=(File.open("C:/Users/#{@mash}/Desktop/devkit/RobinImages/#{k[j][3]}.png",'r')) rescue nil
        end
        @avvie_info=[k[j][3],k[j][4],k[j][5]]
        t=Time.now
        t-=60*60*6
        @scheduler.at "#{t.year}/#{t.month}/#{t.day} #{div[k.length][j+1][0].to_s.rjust(2, '0')}#{div[k.length][j+1][1].to_s.rjust(2, '0')}" do
          next_holiday(bot,1)
        end
      end
    end
  else
    t=Time.now
    t-=60*60*6
    bot.game='Awakening/Fates (FE!help for info)'
    bot.profile.avatar=(File.open("C:/Users/#{@mash}/Desktop/devkit/RobinBot.png",'r')) rescue nil if @shardizard.zero?
    @avvie_info=['Robin','*Fire Emblem Awakening/Fates*','']
    t+=24*60*60
    @scheduler.at "#{t.year}/#{t.month}/#{t.day} 0000" do
      next_holiday(bot,1)
    end
  end
end

bot.ready do |event|
  if @shardizard==4
    for i in 0...bot.servers.values.length
      if ![285663217261477889,443172595580534784,443181099494146068,443704357335203840,449988713330769920,497429938471829504,554231720698707979,523821178670940170,523830882453422120,691616574393811004,523824424437415946,523825319916994564,523822789308841985,532083509083373579,575426885048336388,572792502159933440].include?(bot.servers.values[i].id)
        bot.servers.values[i].general_channel.send_message(get_debug_leave_message()) rescue nil
        bot.servers.values[i].leave
      end
    end
  end
  system("color 1#{"BCD0E"[@shardizard,1]}")
  bot.game="booting, please wait..." if [0,4].include?(@shardizard)
  if !File.exist?("C:/Users/#{@mash}/Desktop/devkit/FETwitter.txt")
    download = open('http://raw.githubusercontent.com/Rot8erConeX/FEIndex/master/FEIndex/FETwitter.txt')
    IO.copy_stream(download, "C:/Users/#{@mash}/Desktop/devkit/FETwitter.txt")
  end
  metadata_load()
  if @ignored.length>0
    for i in 0...@ignored.length
      bot.ignore_user(@ignored[i].to_i)
    end
  end
  metadata_save()
  data_load()
  system("color B#{"14506"[@shardizard,1]}")
  if @shardizard==4
    next_holiday(bot)
    bot.user(bot.profile.id).on(285663217261477889).nickname="RobinBot (Debug)"
    bot.profile.avatar=(File.open("C:/Users/#{@mash}/Desktop/devkit/DebugRobin.png",'r'))
  else
    next_holiday(bot)
  end
  next_birthday(bot)
  system("title #{['Plegian/Vallite','Ylissian/Hoshidan','Valmese/Nohrian','','Golden'][@shardizard]} RobinBot")
  if @shardizard==4
    if File.exist?("C:/Users/#{@mash}/Desktop/devkit/DebugSav.txt")
      b=[]
      File.open("C:/Users/#{@mash}/Desktop/devkit/DebugSav.txt").each_line do |line|
        b.push(eval line)
      end
    else
      b=[]
    end
    bot.channel(285663217261477889).send_message("There are better places to take a nap than on the ground, I know.") if b[0]!='Robin'
    open("C:/Users/#{@mash}/Desktop/devkit/DebugSav.txt", 'w') { |f|
      f.puts '"Robin"'
    }
  end
end

bot.run
