locales = ['en', 'ja', 'ru']
issued_date = Faker::Date.between(from: '1500-01-01', to: '1960-12-30')

locales.each do |n|
  Locale.create!(
    name: n
  )
end

User.create!(
  name: 'yusuke',
  email: 'yusuke@gmail.com',
  password: 'hogehoge',
  profile: '日本人です。I am japanese. Я японец.',
  admin: true
)
User.last.user_locale_statuses.create!(
  locale_id: 2,
  is_native: true
)
User.last.user_locale_statuses.create!(
  locale_id: 3,
  is_wanted: true,
  wanted_level: 'Intermediate'
)


User.create!(
  name: 'Gest',
  email: 'gest@gmail.com',
  password: 'hogehoge',
  profile: '私はゲストです',
  admin: true
)
User.last.user_locale_statuses.create!(
  locale_id: 2,
  is_native: true
)
User.last.user_locale_statuses.create!(
  locale_id: 1,
  is_wanted: true,
  wanted_level: 'Intermediate'
)


Book.create!(
  title: '羅生門',
  author: '芥川龍之介',
  issued_date: issued_date,
  user_id: 1
)
BookLocaleStatus.create!(
  book_id: 1,
  locale_id: 2,
  is_main: true,
  difficulty: ['Unknown', 'Beginner', 'Intermediate','Advanced'].sample
)

content = "ある日の暮方の事である。一人の下人げにんが、羅生門らしょうもんの下で雨やみを待っていた。
　広い門の下には、この男のほかに誰もいない。ただ、所々丹塗にぬりの剥はげた、大きな円柱まるばしらに、蟋蟀きりぎりすが一匹とまっている。羅生門が、朱雀大路すざくおおじにある以上は、この男のほかにも、雨やみをする市女笠いちめがさや揉烏帽子もみえぼしが、もう二三人はありそうなものである。それが、この男のほかには誰もいない。
　何故かと云うと、この二三年、京都には、地震とか辻風つじかぜとか火事とか饑饉とか云う災わざわいがつづいて起った。そこで洛中らくちゅうのさびれ方は一通りではない。旧記によると、仏像や仏具を打砕いて、その丹にがついたり、金銀の箔はくがついたりした木を、路ばたにつみ重ねて、薪たきぎの料しろに売っていたと云う事である。洛中がその始末であるから、羅生門の修理などは、元より誰も捨てて顧る者がなかった。するとその荒れ果てたのをよい事にして、狐狸こりが棲すむ。盗人ぬすびとが棲む。とうとうしまいには、引取り手のない死人を、この門へ持って来て、棄てて行くと云う習慣さえ出来た。そこで、日の目が見えなくなると、誰でも気味を悪るがって、この門の近所へは足ぶみをしない事になってしまったのである。
　その代りまた鴉からすがどこからか、たくさん集って来た。昼間見ると、その鴉が何羽となく輪を描いて、高い鴟尾しびのまわりを啼きながら、飛びまわっている。ことに門の上の空が、夕焼けであかくなる時には、それが胡麻ごまをまいたようにはっきり見えた。鴉は、勿論、門の上にある死人の肉を、啄ついばみに来るのである。――もっとも今日は、刻限こくげんが遅いせいか、一羽も見えない。ただ、所々、崩れかかった、そうしてその崩れ目に長い草のはえた石段の上に、鴉の糞ふんが、点々と白くこびりついているのが見える。下人は七段ある石段の一番上の段に、洗いざらした紺の襖あおの尻を据えて、右の頬に出来た、大きな面皰にきびを気にしながら、ぼんやり、雨のふるのを眺めていた。
　作者はさっき、「下人が雨やみを待っていた」と書いた。しかし、下人は雨がやんでも、格別どうしようと云う当てはない。ふだんなら、勿論、主人の家へ帰る可き筈である。所がその主人からは、四五日前に暇を出された。前にも書いたように、当時京都の町は一通りならず衰微すいびしていた。今この下人が、永年、使われていた主人から、暇を出されたのも、実はこの衰微の小さな余波にほかならない。だから「下人が雨やみを待っていた」と云うよりも「雨にふりこめられた下人が、行き所がなくて、途方にくれていた」と云う方が、適当である。その上、今日の空模様も少からず、この平安朝の下人の Sentimentalisme に影響した。申さるの刻こく下さがりからふり出した雨は、いまだに上るけしきがない。そこで、下人は、何をおいても差当り明日あすの暮しをどうにかしようとして――云わばどうにもならない事を、どうにかしようとして、とりとめもない考えをたどりながら、さっきから朱雀大路にふる雨の音を、聞くともなく聞いていたのである。
　雨は、羅生門をつつんで、遠くから、ざあっと云う音をあつめて来る。夕闇は次第に空を低くして、見上げると、門の屋根が、斜につき出した甍いらかの先に、重たくうす暗い雲を支えている。
　どうにもならない事を、どうにかするためには、手段を選んでいる遑いとまはない。選んでいれば、築土ついじの下か、道ばたの土の上で、饑死うえじにをするばかりである。そうして、この門の上へ持って来て、犬のように棄てられてしまうばかりである。選ばないとすれば――下人の考えは、何度も同じ道を低徊ていかいした揚句あげくに、やっとこの局所へ逢着ほうちゃくした。しかしこの「すれば」は、いつまでたっても、結局「すれば」であった。下人は、手段を選ばないという事を肯定しながらも、この「すれば」のかたをつけるために、当然、その後に来る可き「盗人ぬすびとになるよりほかに仕方がない」と云う事を、積極的に肯定するだけの、勇気が出ずにいたのである。
　下人は、大きな嚔くさめをして、それから、大儀たいぎそうに立上った。夕冷えのする京都は、もう火桶ひおけが欲しいほどの寒さである。風は門の柱と柱との間を、夕闇と共に遠慮なく、吹きぬける。丹塗にぬりの柱にとまっていた蟋蟀きりぎりすも、もうどこかへ行ってしまった。
　下人は、頸くびをちぢめながら、山吹やまぶきの汗袗かざみに重ねた、紺の襖あおの肩を高くして門のまわりを見まわした。雨風の患うれえのない、人目にかかる惧おそれのない、一晩楽にねられそうな所があれば、そこでともかくも、夜を明かそうと思ったからである。すると、幸い門の上の楼へ上る、幅の広い、これも丹を塗った梯子はしごが眼についた。上なら、人がいたにしても、どうせ死人ばかりである。下人はそこで、腰にさげた聖柄ひじりづかの太刀たちが鞘走さやばしらないように気をつけながら、藁草履わらぞうりをはいた足を、その梯子の一番下の段へふみかけた。
　それから、何分かの後である。羅生門の楼の上へ出る、幅の広い梯子の中段に、一人の男が、猫のように身をちぢめて、息を殺しながら、上の容子ようすを窺っていた。楼の上からさす火の光が、かすかに、その男の右の頬をぬらしている。短い鬚の中に、赤く膿うみを持った面皰にきびのある頬である。下人は、始めから、この上にいる者は、死人ばかりだと高を括くくっていた。それが、梯子を二三段上って見ると、上では誰か火をとぼして、しかもその火をそこここと動かしているらしい。これは、その濁った、黄いろい光が、隅々に蜘蛛くもの巣をかけた天井裏に、揺れながら映ったので、すぐにそれと知れたのである。この雨の夜に、この羅生門の上で、火をともしているからは、どうせただの者ではない。
　下人は、守宮やもりのように足音をぬすんで、やっと急な梯子を、一番上の段まで這うようにして上りつめた。そうして体を出来るだけ、平たいらにしながら、頸を出来るだけ、前へ出して、恐る恐る、楼の内を覗のぞいて見た。
　見ると、楼の内には、噂に聞いた通り、幾つかの死骸しがいが、無造作に棄ててあるが、火の光の及ぶ範囲が、思ったより狭いので、数は幾つともわからない。ただ、おぼろげながら、知れるのは、その中に裸の死骸と、着物を着た死骸とがあるという事である。勿論、中には女も男もまじっているらしい。そうして、その死骸は皆、それが、かつて、生きていた人間だと云う事実さえ疑われるほど、土を捏こねて造った人形のように、口を開あいたり手を延ばしたりして、ごろごろ床の上にころがっていた。しかも、肩とか胸とかの高くなっている部分に、ぼんやりした火の光をうけて、低くなっている部分の影を一層暗くしながら、永久に唖おしの如く黙っていた。
　下人げにんは、それらの死骸の腐爛ふらんした臭気に思わず、鼻を掩おおった。しかし、その手は、次の瞬間には、もう鼻を掩う事を忘れていた。ある強い感情が、ほとんどことごとくこの男の嗅覚を奪ってしまったからだ。
　下人の眼は、その時、はじめてその死骸の中に蹲うずくまっている人間を見た。檜皮色ひわだいろの着物を着た、背の低い、痩やせた、白髪頭しらがあたまの、猿のような老婆である。その老婆は、右の手に火をともした松の木片きぎれを持って、その死骸の一つの顔を覗きこむように眺めていた。髪の毛の長い所を見ると、多分女の死骸であろう。
　下人は、六分の恐怖と四分の好奇心とに動かされて、暫時ざんじは呼吸いきをするのさえ忘れていた。旧記の記者の語を借りれば、「頭身とうしんの毛も太る」ように感じたのである。すると老婆は、松の木片を、床板の間に挿して、それから、今まで眺めていた死骸の首に両手をかけると、丁度、猿の親が猿の子の虱しらみをとるように、その長い髪の毛を一本ずつ抜きはじめた。髪は手に従って抜けるらしい。
　その髪の毛が、一本ずつ抜けるのに従って、下人の心からは、恐怖が少しずつ消えて行った。そうして、それと同時に、この老婆に対するはげしい憎悪が、少しずつ動いて来た。――いや、この老婆に対すると云っては、語弊ごへいがあるかも知れない。むしろ、あらゆる悪に対する反感が、一分毎に強さを増して来たのである。この時、誰かがこの下人に、さっき門の下でこの男が考えていた、饑死うえじにをするか盗人ぬすびとになるかと云う問題を、改めて持出したら、恐らく下人は、何の未練もなく、饑死を選んだ事であろう。それほど、この男の悪を憎む心は、老婆の床に挿した松の木片きぎれのように、勢いよく燃え上り出していたのである。
　下人には、勿論、何故老婆が死人の髪の毛を抜くかわからなかった。従って、合理的には、それを善悪のいずれに片づけてよいか知らなかった。しかし下人にとっては、この雨の夜に、この羅生門の上で、死人の髪の毛を抜くと云う事が、それだけで既に許すべからざる悪であった。勿論、下人は、さっきまで自分が、盗人になる気でいた事なぞは、とうに忘れていたのである。
　そこで、下人は、両足に力を入れて、いきなり、梯子から上へ飛び上った。そうして聖柄ひじりづかの太刀に手をかけながら、大股に老婆の前へ歩みよった。老婆が驚いたのは云うまでもない。
　老婆は、一目下人を見ると、まるで弩いしゆみにでも弾はじかれたように、飛び上った。
「おのれ、どこへ行く。」
　下人は、老婆が死骸につまずきながら、慌てふためいて逃げようとする行手を塞ふさいで、こう罵ののしった。老婆は、それでも下人をつきのけて行こうとする。下人はまた、それを行かすまいとして、押しもどす。二人は死骸の中で、しばらく、無言のまま、つかみ合った。しかし勝敗は、はじめからわかっている。下人はとうとう、老婆の腕をつかんで、無理にそこへ※(「てへん＋丑」、第4水準2-12-93)ねじ倒した。丁度、鶏にわとりの脚のような、骨と皮ばかりの腕である。
「何をしていた。云え。云わぬと、これだぞよ。」
　下人は、老婆をつき放すと、いきなり、太刀の鞘さやを払って、白い鋼はがねの色をその眼の前へつきつけた。けれども、老婆は黙っている。両手をわなわなふるわせて、肩で息を切りながら、眼を、眼球めだまが※(「目＋匡」、第3水準1-88-81)まぶたの外へ出そうになるほど、見開いて、唖のように執拗しゅうねく黙っている。これを見ると、下人は始めて明白にこの老婆の生死が、全然、自分の意志に支配されていると云う事を意識した。そうしてこの意識は、今までけわしく燃えていた憎悪の心を、いつの間にか冷ましてしまった。後あとに残ったのは、ただ、ある仕事をして、それが円満に成就した時の、安らかな得意と満足とがあるばかりである。そこで、下人は、老婆を見下しながら、少し声を柔らげてこう云った。
「己おれは検非違使けびいしの庁の役人などではない。今し方この門の下を通りかかった旅の者だ。だからお前に縄なわをかけて、どうしようと云うような事はない。ただ、今時分この門の上で、何をして居たのだか、それを己に話しさえすればいいのだ。」
　すると、老婆は、見開いていた眼を、一層大きくして、じっとその下人の顔を見守った。※(「目＋匡」、第3水準1-88-81)まぶたの赤くなった、肉食鳥のような、鋭い眼で見たのである。それから、皺で、ほとんど、鼻と一つになった唇を、何か物でも噛んでいるように動かした。細い喉で、尖った喉仏のどぼとけの動いているのが見える。その時、その喉から、鴉からすの啼くような声が、喘あえぎ喘ぎ、下人の耳へ伝わって来た。
「この髪を抜いてな、この髪を抜いてな、鬘かずらにしようと思うたのじゃ。」
　下人は、老婆の答が存外、平凡なのに失望した。そうして失望すると同時に、また前の憎悪が、冷やかな侮蔑ぶべつと一しょに、心の中へはいって来た。すると、その気色けしきが、先方へも通じたのであろう。老婆は、片手に、まだ死骸の頭から奪った長い抜け毛を持ったなり、蟇ひきのつぶやくような声で、口ごもりながら、こんな事を云った。
「成程な、死人しびとの髪の毛を抜くと云う事は、何ぼう悪い事かも知れぬ。じゃが、ここにいる死人どもは、皆、そのくらいな事を、されてもいい人間ばかりだぞよ。現在、わしが今、髪を抜いた女などはな、蛇を四寸しすんばかりずつに切って干したのを、干魚ほしうおだと云うて、太刀帯たてわきの陣へ売りに往いんだわ。疫病えやみにかかって死ななんだら、今でも売りに往んでいた事であろ。それもよ、この女の売る干魚は、味がよいと云うて、太刀帯どもが、欠かさず菜料さいりように買っていたそうな。わしは、この女のした事が悪いとは思うていぬ。せねば、饑死をするのじゃて、仕方がなくした事であろ。されば、今また、わしのしていた事も悪い事とは思わぬぞよ。これとてもやはりせねば、饑死をするじゃて、仕方がなくする事じゃわいの。じゃて、その仕方がない事を、よく知っていたこの女は、大方わしのする事も大目に見てくれるであろ。」
　老婆は、大体こんな意味の事を云った。
　下人は、太刀を鞘さやにおさめて、その太刀の柄つかを左の手でおさえながら、冷然として、この話を聞いていた。勿論、右の手では、赤く頬に膿を持った大きな面皰にきびを気にしながら、聞いているのである。しかし、これを聞いている中に、下人の心には、ある勇気が生まれて来た。それは、さっき門の下で、この男には欠けていた勇気である。そうして、またさっきこの門の上へ上って、この老婆を捕えた時の勇気とは、全然、反対な方向に動こうとする勇気である。下人は、饑死をするか盗人になるかに、迷わなかったばかりではない。その時のこの男の心もちから云えば、饑死などと云う事は、ほとんど、考える事さえ出来ないほど、意識の外に追い出されていた。
「きっと、そうか。」
　老婆の話が完おわると、下人は嘲あざけるような声で念を押した。そうして、一足前へ出ると、不意に右の手を面皰にきびから離して、老婆の襟上えりがみをつかみながら、噛みつくようにこう云った。
「では、己おれが引剥ひはぎをしようと恨むまいな。己もそうしなければ、饑死をする体なのだ。」
　下人は、すばやく、老婆の着物を剥ぎとった。それから、足にしがみつこうとする老婆を、手荒く死骸の上へ蹴倒した。梯子の口までは、僅に五歩を数えるばかりである。下人は、剥ぎとった檜皮色ひわだいろの着物をわきにかかえて、またたく間に急な梯子を夜の底へかけ下りた。
　しばらく、死んだように倒れていた老婆が、死骸の中から、その裸の体を起したのは、それから間もなくの事である。老婆はつぶやくような、うめくような声を立てながら、まだ燃えている火の光をたよりに、梯子の口まで、這って行った。そうして、そこから、短い白髪しらがを倒さかさまにして、門の下を覗きこんだ。外には、ただ、黒洞々こくとうとうたる夜があるばかりである。
　下人の行方ゆくえは、誰も知らない。"

Sentence.make_sentences_from_book(2, Book.last.id, content )

Book.create!(
  title: 'Alice’s Adventures in Wonderland',
  author: 'Lewis Carroll',
  issued_date: issued_date,
  user_id: 1
)

BookLocaleStatus.create!(
  book_id: 2,
  locale_id: 1,
  is_main: true,
  difficulty: ['Unknown', 'Beginner', 'Intermediate','Advanced'].sample
)
content = "Alice was beginning to get very tired of sitting by her sister on the bank, and of having nothing to do: once or twice she had peeped into the book her sister was reading, but it had no pictures or conversations in it, “and what is the use of a book,” thought Alice “without pictures or conversations?”

So she was considering in her own mind (as well as she could, for the hot day made her feel very sleepy and stupid), whether the pleasure of making a daisy-chain would be worth the trouble of getting up and picking the daisies, when suddenly a White Rabbit with pink eyes ran close by her.

There was nothing so very remarkable in that; nor did Alice think it so very much out of the way to hear the Rabbit say to itself, “Oh dear! Oh dear! I shall be late!” (when she thought it over afterwards, it occurred to her that she ought to have wondered at this, but at the time it all seemed quite natural); but when the Rabbit actually took a watch out of its waistcoat-pocket, and looked at it, and then hurried on, Alice started to her feet, for it flashed across her mind that she had never before seen a rabbit with either a waistcoat-pocket, or a watch to take out of it, and burning with curiosity, she ran across the field after it, and fortunately was just in time to see it pop down a large rabbit-hole under the hedge.

In another moment down went Alice after it, never once considering how in the world she was to get out again.

The rabbit-hole went straight on like a tunnel for some way, and then dipped suddenly down, so suddenly that Alice had not a moment to think about stopping herself before she found herself falling down a very deep well.

Either the well was very deep, or she fell very slowly, for she had plenty of time as she went down to look about her and to wonder what was going to happen next. First, she tried to look down and make out what she was coming to, but it was too dark to see anything; then she looked at the sides of the well, and noticed that they were filled with cupboards and book-shelves; here and there she saw maps and pictures hung upon pegs. She took down a jar from one of the shelves as she passed; it was labelled “ORANGE MARMALADE”, but to her great disappointment it was empty: she did not like to drop the jar for fear of killing somebody underneath, so managed to put it into one of the cupboards as she fell past it.

“Well!” thought Alice to herself, “after such a fall as this, I shall think nothing of tumbling down stairs! How brave they’ll all think me at home! Why, I wouldn’t say anything about it, even if I fell off the top of the house!” (Which was very likely true.)

Down, down, down. Would the fall never come to an end? “I wonder how many miles I’ve fallen by this time?” she said aloud. “I must be getting somewhere near the centre of the earth. Let me see: that would be four thousand miles down, I think—” (for, you see, Alice had learnt several things of this sort in her lessons in the schoolroom, and though this was not a very good opportunity for showing off her knowledge, as there was no one to listen to her, still it was good practice to say it over) “—yes, that’s about the right distance—but then I wonder what Latitude or Longitude I’ve got to?” (Alice had no idea what Latitude was, or Longitude either, but thought they were nice grand words to say.)

Presently she began again. “I wonder if I shall fall right through the earth! How funny it’ll seem to come out among the people that walk with their heads downward! The Antipathies, I think—” (she was rather glad there was no one listening, this time, as it didn’t sound at all the right word) “—but I shall have to ask them what the name of the country is, you know. Please, Ma’am, is this New Zealand or Australia?” (and she tried to curtsey as she spoke—fancy curtseying as you’re falling through the air! Do you think you could manage it?) “And what an ignorant little girl she’ll think me for asking! No, it’ll never do to ask: perhaps I shall see it written up somewhere.”

Down, down, down. There was nothing else to do, so Alice soon began talking again. “Dinah’ll miss me very much to-night, I should think!” (Dinah was the cat.) “I hope they’ll remember her saucer of milk at tea-time. Dinah my dear! I wish you were down here with me! There are no mice in the air, I’m afraid, but you might catch a bat, and that’s very like a mouse, you know. But do cats eat bats, I wonder?” And here Alice began to get rather sleepy, and went on saying to herself, in a dreamy sort of way, “Do cats eat bats? Do cats eat bats?” and sometimes, “Do bats eat cats?” for, you see, as she couldn’t answer either question, it didn’t much matter which way she put it. She felt that she was dozing off, and had just begun to dream that she was walking hand in hand with Dinah, and saying to her very earnestly, “Now, Dinah, tell me the truth: did you ever eat a bat?” when suddenly, thump! thump! down she came upon a heap of sticks and dry leaves, and the fall was over.

Alice was not a bit hurt, and she jumped up on to her feet in a moment: she looked up, but it was all dark overhead; before her was another long passage, and the White Rabbit was still in sight, hurrying down it. There was not a moment to be lost: away went Alice like the wind, and was just in time to hear it say, as it turned a corner, “Oh my ears and whiskers, how late it’s getting!” She was close behind it when she turned the corner, but the Rabbit was no longer to be seen: she found herself in a long, low hall, which was lit up by a row of lamps hanging from the roof.

There were doors all round the hall, but they were all locked; and when Alice had been all the way down one side and up the other, trying every door, she walked sadly down the middle, wondering how she was ever to get out again.

Suddenly she came upon a little three-legged table, all made of solid glass; there was nothing on it except a tiny golden key, and Alice’s first thought was that it might belong to one of the doors of the hall; but, alas! either the locks were too large, or the key was too small, but at any rate it would not open any of them. However, on the second time round, she came upon a low curtain she had not noticed before, and behind it was a little door about fifteen inches high: she tried the little golden key in the lock, and to her great delight it fitted!

Alice opened the door and found that it led into a small passage, not much larger than a rat-hole: she knelt down and looked along the passage into the loveliest garden you ever saw. How she longed to get out of that dark hall, and wander about among those beds of bright flowers and those cool fountains, but she could not even get her head through the doorway; “and even if my head would go through,” thought poor Alice, “it would be of very little use without my shoulders. Oh, how I wish I could shut up like a telescope! I think I could, if I only knew how to begin.” For, you see, so many out-of-the-way things had happened lately, that Alice had begun to think that very few things indeed were really impossible.

There seemed to be no use in waiting by the little door, so she went back to the table, half hoping she might find another key on it, or at any rate a book of rules for shutting people up like telescopes: this time she found a little bottle on it, (“which certainly was not here before,” said Alice,) and round the neck of the bottle was a paper label, with the words “DRINK ME,” beautifully printed on it in large letters.

It was all very well to say “Drink me,” but the wise little Alice was not going to do that in a hurry. “No, I’ll look first,” she said, “and see whether it’s marked ‘poison’ or not”; for she had read several nice little histories about children who had got burnt, and eaten up by wild beasts and other unpleasant things, all because they would not remember the simple rules their friends had taught them: such as, that a red-hot poker will burn you if you hold it too long; and that if you cut your finger very deeply with a knife, it usually bleeds; and she had never forgotten that, if you drink much from a bottle marked “poison,” it is almost certain to disagree with you, sooner or later.

However, this bottle was not marked “poison,” so Alice ventured to taste it, and finding it very nice, (it had, in fact, a sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very soon finished it off."

Sentence.make_sentences_from_book(1, Book.last.id, content )

Book.create!(
  title: 'Народные русские сказки',
  author: 'Александр Николаевич Афанасьев',
  issued_date: issued_date,
  user_id: 1
)
BookLocaleStatus.create!(
  book_id: 3,
  locale_id: 3,
  is_main: true,
  difficulty: ['Unknown', 'Beginner', 'Intermediate','Advanced'].sample
)

content = "В колыбельной песне, сказке, прибаутке, былине художественное слово является нам раньше всего, о нем и чуть ли не самая первая память. Есть и память, заключенная в нем самом, причем память самая долгая и самая всеобщая. Как всегда, хорошая память указует вперед, образует дорогу. Надо знать и дорогу, и направление. «Дорогато есть, я стою на твердой полосе; да что толку?» Необычайно меткое это усмотрение Пушкина в «Капитанской дочке». Человек, который у него так говорил, вроде бы знал народ, был сам совершенно народен; Петруше он со значением рассказал и известную сказку о разнице между горячей живой кровью своих жертв и чьимто питанием мертвечиной (орел и ворон). Однако вопрос об истинном направлении он лично оставил открытым, и для народа не меньше, чем для себя.
Содержанием, состоянием, «безумной прихотью» отдельного человека не исчерпывается достояние всего народа.
Отдельный человек может вообще не знать поговорок и сказок, а былин не слыхать и подавно. Ктото не может припомнить по своему детству как раз самых драгоценных слов. А народу в целом именно полнота ранней памяти и свойственна – как по «жанрам», так и по содержательному существу.
Народ помнит себя вовсе не только со дня, когда ктото умный привел его за руку в довольно среднюю школу и сказал: теперь, маленький, поучись. Это не значит, что настоящего детства у народа не было. Один классический мыслитель именно о народах древности и заметил: есть буйные, невоспитанные дети, и есть старчески умные дети. Нормальными детьми были греки, добавил классик: Прометей, Эдип, Дедал, Геракл – там везде дерзание, везде бодрость и здоровье смолоду. Он не разъяснил, кто относится к первым двум разновидностям, и науке стоит заняться этим особо. Но детство как ценность признается им не без оснований.
К этой детской, но коренной, к этой дописьменной, но ясной и твердой памяти народов тянется здоровая память отдельных людей, и это для зрелости только полезно. Иногда без этого настоящая зрелость и невозможна. Это видно по самым умным людям России. «Ах, умолчу ль о мамушке моей», – пишет Пушкин и тут же переходит к сказкам «мамушки» про лихих полканов и добрыней, о чудесах и подвигах Бовы. Поздний пушкинский «Гусар» сталкивается с чудесами малоблагообразными, но именно лихость доброго сказочного склада ему и помогает уйти от «мерзостной игры» – даже, помнится, сорвать её. Пушкин к тому времени уже давно созрел; он получил немало именно от няни – вдобавок к царственному Лицею; а искушенным литераторам, не знавшим этого, он советовал учиться коечему у просвирней, не обольщаясь ни лицеем, ни университетом. Слушаю сказки няни – и восполняю тем недостаток своего проклятого образования… Как честно, как смело сказано! Ах, нянины сказки, что за прелесть они: каждая народная сказка есть поэма, по Пушкину. Без этой убежденности великого художника не родились бы ни «Руслан и Людмила», ни «Царь Салтан», ни даже «Капитанская дочка» – то есть именно прямые поэмы, желающие сравняться с народною сказкой; так музыка Глинки и Чайковского или «Снегурочки» равнялась на русскую сказку и русский народный напев, и только потому преуспела как всемирная ценность. (Да так и во всех здоровых обществах: что такое «Лесной царь» величественного Гёте?)
Общества и люди меняются. Как село может превратиться, за утратой ряда коренных признаков, в «населенный пункт», так и земля может стать простой «территорией». Как новые кварталы, стесняясь классического слова «переулок» (стеснение и стыд не без оснований), предлагают нам в качестве замены некий почемуто «проезд» – так происходит и с бабушкою, и с няней. Даже простые пушкинские Никитские ворота, ликвидировав свою безграмотность и ряд ненужных зданий – например, славный когдато гастроном «Три поросенка», – стали «площадью Никитских ворот». И как округлая площадь вообще иногда перестраивается в бездушно огромный перекресток, который пользуется, по существу, чуждым ему именем, – так и здесь. С одной стороны, Арина Родионовна и переулок, а с другой – радионяня и проезд. И драматизировать это не надо. Надо просто понять, что поджарой пятидесятилетней женщине в тренировочном костюме «Адидас» и кроссовках для утренних пробежек все эти занятия, все ее умные журналы и садовоогородный участок не так уж много оставляют времени вспомнить сказку. А учебники и «Родная речь» не могут ведь распухнуть. Поэтому им некогда напомнить людям о том, о чем во времена, когда еще не было «стрессов и страстей», люди вспоминали постоянно:"
Sentence.make_sentences_from_book(3, Book.last.id, content )


100.times do |n|
  name = Faker::Name.name
  email = Faker::Internet.email
  password = 'hogehoge'
  profile = "Hello. I am #{name}."

  User.create!(
    name: name,
    email: email,
    password: password,
    profile: profile,
  )
end


User.all.each do |n|
  UserLocaleStatus.create!(
    user_id: n.id,
    locale_id: [1, 2, 3].sample,
    is_native: true
  )
  UserLocaleStatus.create!(
    user_id: n.id,
    locale_id: [1, 2, 3].sample,
    is_wanted: true,
    wanted_level: ['Beginner','Elementary','Intermediate','Advanced','Proficient'].sample
  )
end


user_ids = User.all.map { |n| n.id }

locales_ids = Locale.all.map { |n| n.id }

book_ids = Book.all.map { |n| n.id }

sentence_ids = Sentence.all.map { |n| n.id }

3000.times do |n|
  user = User.find(user_ids.sample)
  sentence_id = sentence_ids.sample
  book = Sentence.find(sentence_id).book
  Translation.create!(
    content: "テスト翻訳#{n}",
    user_id: user.id,
    sentence_id: sentence_id,
    book_locale: book.book_locale_statuses[0].locale.name,
    user_locale: user.user_locale_statuses.find_by(is_wanted: true).locale.name,
  )
end

translation_ids = Translation.all.map { |n| n.id }

translation_ids.each do |n|
  UserTranslationFavorite.create!(
    translation_id: n,
    user_id: user_ids.sample,
  )
end

translation_ids.each do |n|
  contents = ['いい翻訳ですね！','This is a good translation!','Это хороший перевод!', '誤って翻訳していますよ']
  UserTranslationComment.create!(
    content: contents.sample,
    translation_id: n,
    user_id: user_ids.sample,
  )
end

user_ids.each do |n|
  user_id2 = user_ids.sample
  Relationship.create!(
    follower_id: n,
    followed_id: user_id2
  )
end
