;;; funcs.el --- Grammar Layer functions File for Spacemacs

(defun cats-grammar/add-writegood-hook (hook)
  "Add `writespell-mode' to the given HOOK, if
`grammar-checking-enable-by-default' is true."
  (when grammar-checking-enable-by-default
    (add-hook hook 'flyspell-mode)))

(defcustom writegood-cliches
  '(
    "accidentally on purpose"
    "accident waiting to happen"
    "actions speak louder than words"
    "act of contrition"
    "acid test"
    "add insult to injury"
    "after due consideration"
    "all intents and purposes"
    "all in the same boat"
    "all over bar the shouting"
    "all things considered"
    "almost too good to be true"
    "angel of mercy"
    "angry silence"
    "as a matter of fact"
    "as luck would have it"
    "as sure as eggs is"
    "at the end of the day"
    "at this moment"
    "at this point in time"
    "auspicious occasion"
    "avid reader"
    "baby with the bathwater"
    "backseat driver"
    "back to basics"
    "back to the drawing board"
    "bag and baggage"
    "bag of tricks"
    "ballpark figure"
    "ball’s in your court"
    "bang your head against a brick wall"
    "barking up the wrong tree"
    "bat an eyelid"
    "batten down the hatches"
    "beavering away"
    "beer and skittles"
    "before you can say Jack Robinson"
    "beggars can’t be choosers"
    "be that as it may"
    "between a rock and a hard place"
    "bite the bullet"
    "blessing in disguise"
    "blind leading the blind"
    "blissful ignorance"
    "blood out of a stone"
    "bloody but unbowed"
    "blow hot and cold"
    "blot on the landscape"
    "blow the whistle"
    "blue rinse brigade"
    "blushing bride"
    "bone of contention"
    "borrowed time"
    "bottom line"
    "breath of fresh air"
    "bright eyed and bushy tailed"
    "brought to book"
    "brownie points"
    "bruising battle"
    "bumper to bumper traffic jam"
    "by the same tokencall it a day"
    "callow youth"
    "calm before the storm"
    "camp as a row of tents"
    "can of worms"
    "captive audience"
    "card up his sleeve"
    "cards stacked against us"
    "cardinal sin"
    "carte blanche"
    "cast of thousands"
    "Catch 22 situation"
    "catalogue of errors"
    "cat among the pigeons"
    "catholic tastes"
    "caustic comment"
    "cautious optimism"
    "centre of the universe"
    "chalk and cheese"
    "champing at the bit"
    "chapter and verse"
    "chapter of accidents"
    "cheek by jowl"
    "cheque’s in the post"
    "cheap and cheerful"
    "cherished belief"
    "chew the cud"
    "chew the fat"
    "chop and change"
    "chorus of approval"
    "chorus of dispproval"
    "chosen few"
    "circumstances beyond our control"
    "cold light of day"
    "cold water on"
    "come home to roost"
    "comes to the crunch"
    "common or garden"
    "compulsive viewing"
    "compulsive reading"
    "conspicious by his absence"
    "conspicuous by her absence"
    "cool as a cucumber"
    "cool"
    "copious notes"
    "crack of dawn"
    "crazy like a fox"
    "crème de la crème"
    "crisis of confidence"
    "cross that bridge when we come to it"
    "cry over spilt milk"
    "current climate"
    "cut a long story short"
    "cut and dried"
    "cut any ice"
    "cutting edgedamn with faint praise"
    "Darby and Joan"
    "darkest hour is just before dawn"
    "dark secret"
    "day in"
    "dead as a dodo"
    "dead in the water"
    "deadly accurate"
    "dead of night"
    "dead to the world"
    "deafening silence"
    "deaf to entreaties"
    "death’s door"
    "death warmed up"
    "depths of depravity"
    "desert a sinking ship"
    "despite misgivings"
    "devour every word "
    "dicing with death"
    "dim and distant past"
    "dog eat dog"
    "donkey’s years ago"
    "don’t call us"
    "don’t count your chickens before they’re hatched"
    "doom and gloom merchants"
    "dot the i’s and cross the t’s"
    "drop of a hat"
    "dry as a bone"
    "dyed in the wooleach and everyone"
    "eager beaver"
    "eagerly devour"
    "ear to the ground"
    "easier said than done"
    "eat humble pie"
    "eat your heart out"
    "economical with the truth"
    "empty nest"
    "enfant terrible"
    "eternal regret"
    "eternal shame"
    "every dog has his day"
    "every man jack of them"
    "everything but the kitchen sink"
    "every little helps"
    "every stage of the game"
    "explore every avenue"
    "face the facts"
    "face the music"
    "fact of the matter"
    "fair and square"
    "fair sex"
    "fall between two stools"
    "fall by the wayside"
    "fall on deaf ears"
    "far and wide"
    "far be it from me"
    "fast and furious"
    "fast lane"
    "fate worse than death"
    "feel-good factor"
    "few and far between"
    "field day"
    "fighting fit"
    "final insult"
    "fine-tooth comb"
    "finger in every pie"
    "finger of suspicion"
    "firing on all cylinders"
    "first and foremost"
    "first things first"
    "fish out of water"
    "fit as a fiddle"
    "fits and starts"
    "flash in the pan"
    "flat as a pancake"
    "flat denial"
    "flavour of the month"
    "flog a dead horse"
    "fly in the ointment"
    "fond belief"
    "food for thought"
    "footloose and fancy free"
    "forlorn hope"
    "fraught with danger"
    "fraught with peril"
    "free"
    "frenzy of activity"
    "from the sublime to the ridiculous"
    "from the word go"
    "fudge the issue"
    "fullness of time"
    "funny ha-ha or funny peculiar?"
    "F-wordgainful employment"
    "gameplan"
    "generous to a fault"
    "gentle giant"
    "gentleman’s agreement"
    "gentler sex"
    "girl Friday"
    "give a dog a bad name"
    "give him an inch and he’ll take a yard"
    "give up the ghost"
    "glowing tribute"
    "glutton for punishment"
    "goes without saying"
    "goes from strength to strength"
    "golden opportunity"
    "good as gold"
    "go off half-cocked"
    "gory details"
    "grasp the nettle"
    "greatest thing since sliced bread"
    "great unwashed"
    "green with envy"
    "grim death"
    "grin and bear it"
    "grind to a halt"
    "ground to a halt"
    "grist to the mill"
    "guardian angelhale and hearty"
    "hand in glove with"
    "handle with kid gloves"
    "hand over fist"
    "hand to mouth existence"
    "handwriting is on the wall"
    "hanged for a sheep as a lamb"
    "happy accident"
    "happy hunting"
    "happily ensconced"
    "hard and fast rule"
    "has what it takes"
    "having said that"
    "have a nice one"
    "have got a lot on my plate"
    "have I got news for you?"
    "head and shoulders above"
    "heaping ridicule"
    "heart and soul"
    "heart’s in the right place"
    "hell or high water"
    "high and dry"
    "hit or miss"
    "hit the nail on the head"
    "hit the panic button"
    "hive of activity"
    "Hobson’s choice"
    "hold your horses"
    "hoist with his own petard"
    "honest truth"
    "hope against hope"
    "horns of a dilemma"
    "horses for courses"
    "howling gale"
    "how long is a piece of string?"
    "how time fliesif the worst comes to the worst"
    "if you can’t beat ‘em"
    "if you can’t stand the heat get out of the kitchen"
    "if you’ve got it"
    "ignorance is bliss"
    "ill-gotten gains"
    "ill-starred venture"
    "impossible dream"
    "in all conscience"
    "in all honesty"
    "in a nutshell"
    "inch-by-inch search"
    "in less than no time"
    "in one ear and out the other"
    "inordinate amount of"
    "in the pipeline"
    "in this day and age"
    "iota"
    "it never rains but it pours"
    "it’s a small world"
    "it’s not the end of the world"
    "it stands to reason"
    "it will all come out in the wash"
    "it will all end in tears"
    "it will soon blow over"
    "ivory towerjack of all trades "
    "jaundiced eye"
    "jewel in the crown"
    "Johnny-come-lately"
    "jockey for position"
    "jump on the bandwagon"
    "jump the gun"
    "just deserts"
    "just for the record"
    "just what the doctor orderedkeep a low profile"
    "keep a straight face"
    "keep my head up"
    "keep your head up"
    "your head above water"
    "keep the wolf from the door"
    "keep your chin up"
    "keep your nose clean"
    "keep your nose to the grindstone"
    "kickstart"
    "kill two birds with one stone"
    "kill with kindness"
    "kiss of death"
    "knee-high to a grasshopper"
    "knocked into a cocked hat"
    "knocked the spots off"
    "knocks the spots off"
    "know the ropes"
    "know which side your bread’s buttered on"
    "knuckle underlabour of love"
    "lack-lustre performance"
    "lap of luxury"
    "large as life"
    "larger than life"
    "last but not least"
    "last straw"
    "late in the day"
    "laugh all the way to the bank"
    "laugh up your sleeve"
    "lavish praise"
    "lay it on with a trowel"
    "leading light"
    "leave in the lurch"
    "left in the lurch"
    "leave no stone unturned "
    "let bygones be bygones"
    "let’s get this show on the road"
    "let sleeping dogs lie"
    "well alone"
    "lick his wounds"
    "lick their wounds"
    "level playing field"
    "light at the end of the tunnel"
    "like a house on fire"
    "little the wiser"
    "little woman"
    "live and let live"
    "local difficulty"
    "lock"
    "long arm of the law"
    "long hot summer"
    "long time no see"
    "loose end"
    "lost cause"
    "lost in admiration"
    "lost in contemplation"
    "love you and leave you"
    "made a killing"
    "make a killing"
    "make a mountain out of a molehill"
    "make an offer I can’t refuse"
    "make ends meet"
    "make hay while the sun shines"
    "make no bones about it"
    "make my day"
    "make or break"
    "make short work of it"
    "making short work of it"
    "make the best of a bad job"
    "making the best of a bad job"
    "make tracks"
    "making tracks"
    "man after my own heart"
    "make waves"
    "making waves"
    "manna from heaven"
    "man of straw"
    "man of the world"
    "man to man"
    "many hands make light work"
    "mark my words"
    "matter of life and death"
    "method in his madness"
    "Midas touch"
    "millstone around your neck"
    "mind boggles"
    "mixed blessing "
    "model of its kind"
    "model of propriety"
    "moment of truth"
    "moot point"
    "more haste"
    "more in sorrow than in anger"
    "more than meets the eye"
    "more the merrier"
    "mortgaged to the hilt"
    "movers and shakers"
    "move the goalposts"
    "much-needed reforms"
    "much of a muchness"
    "muddy the waters"
    "mutton dressed as lambnail in his coffin"
    "name of the game"
    "nearest and dearest"
    "necessity is the mother of invention"
    "neck and neck"
    "needle in a haystack"
    "needless to say"
    "neither here nor there"
    "new lease of life"
    "nick of time"
    "nip it in the bud"
    "nipped in the bud"
    "nitty-gritty"
    "no expense spared"
    "no names"
    "no news is good news"
    "no peace for the wicked"
    "no problem"
    "no skin off my nose"
    "no spring chicken"
    "nothing to write home about"
    "nothing ventured"
    "not just a pretty face"
    "not out of the woods yet"
    "not to be sneezed at"
    "not to put too fine a point on it"
    "now or neverodd man out"
    "odds and ends"
    "off the beaten track"
    "off the cuff"
    "old as the hills"
    "older and wiser"
    "once bitten"
    "once in a blue moon"
    "one fell swoop"
    "one in a million"
    "only time will tell"
    "on the ball"
    "on the level"
    "on the spur of the moment"
    "on the tip of my tongue"
    "out of sight"
    "out of the blue"
    "out on a limb"
    "over and done with"
    "over my dead body"
    "over the top"
    "own goal"
    "own worst enemypacked in like sardines"
    "painstaking investigation"
    "pale into insignificance"
    "palpable nonsense"
    "paper over the cracks"
    "par for the course"
    "part and parcel"
    "pass muster"
    "past its sell-by date"
    "patter of tiny feet"
    "pay through your nose"
    "pecking order"
    "picture of health"
    "piece de resistance"
    "pie in the sky"
    "pinpoint accuracy"
    "plain as a pikestaff"
    "plain as the nose on your face"
    "play your cards right"
    "pleased as Punch"
    "point of no return"
    "poisoned chalice"
    "pound of flesh"
    "powers that be"
    "practice makes perfect"
    "press on regardless"
    "pride and joy"
    "pride of place"
    "proof of the pudding"
    "pull out all the stops"
    "pure as the driven snow"
    "put on hold"
    "put on the back burner"
    "put two and two together"
    "put up or shut up"
    "put your best foot forward"
    "put your foot down"
    "put your money where your mouth is"
    "put your nose out of jointquality of life"
    "quantum leap"
    "queer the pitch"
    "quick and the dead"
    "quid pro quo"
    "quiet before the storm"
    "rack and ruin"
    "raining cats and dogs "
    "rat race"
    "read my lips"
    "red rag to a bull"
    "reinventing the wheel"
    "resounding silence"
    "right as rain"
    "rings a bell"
    "rings true"
    "risk life and limb"
    "rock the boat"
    "Rome wasn’t built in a day"
    "rose by any other name"
    "rotten apple in a barrel"
    "rough diamond"
    "ruffled feathers"
    "ruled with a rod of iron"
    "run it up the flagpole"
    "run of the mill"
    "run to seedsafe and sound"
    "sailing close to the wind"
    "sale of the century"
    "salt of the earth"
    "saved by the bell"
    "search high and low"
    "second to none"
    "seething cauldron"
    "see eye to eye"
    "see how the land lies"
    "see the wood for the trees"
    "sell like hot cakes"
    "serious money"
    "set in stone"
    "set in concrete"
    "shape or form"
    "share and share alike"
    "ships that pass in the night"
    "shoot yourself in the foot"
    "shot himself in the foot"
    "short and sweet"
    "shot across the bows"
    "sick and tired"
    "sick as a parrot"
    "sight for sore eyes"
    "signed"
    "silent majority"
    "simmering hatred"
    "sitting duck"
    "sixes and sevens"
    "six of one and half-a-dozen of the other"
    "skating on thin ice"
    "skin of his teeth"
    "slaving over a hot stove all day"
    "slowly but surely"
    "smell a rat"
    "snatch defeat from the jaws of victory"
    "so far so good"
    "solid as a rock"
    "so near and yet so far"
    "sorely needed"
    "sour grapes"
    "splendid isolation"
    "square peg in a round hole"
    "straight and narrow"
    "straight from the shoulder"
    "strange as it may seem"
    "strike while the iron’s hot"
    "suffer fools gladly"
    "suffer in silence"
    "survival of the fittest"
    "sugar the pill"
    "sweetness and light"
    "swept off his feet"
    "swings and roundaboutstail between his legs"
    "take it with a grain of salt"
    "take the bull by the horns"
    "take the rough with the smooth"
    "tarred with the same brush"
    "technological wizardry"
    "teething troublesv"
    "tender loving care"
    "tender mercies"
    "terra firma"
    "thankful for small mercies"
    "that’s life"
    "that’s the way the cookie crumbles"
    "there but for the grace of God go I"
    "thereby hangs a tale"
    "there’s no such thing as a free lunch"
    "this day and age"
    "throw in the towel"
    "thunderous applause"
    "tighten our belts"
    "time flies"
    "time heals everything"
    "time heals all ills"
    "time waits for no man"
    "tip of the iceberg"
    "tired and emotional"
    "tireless crusader"
    "tissue of lies"
    "to all intents and purposes"
    "tomorrow is another day"
    "too little"
    "to my dying day"
    "too terrible to contemplate"
    "too many cooks "
    "too numerous to mention"
    "torrential rain"
    "towering inferno"
    "tower of strength"
    "trials and tribulations"
    "turn a deaf ear"
    "turn over a new leaf"
    "twenty-twenty hindsight"
    "twinkling of an eye"
    "twisted him around her little finger"
    "two’s company"
    "unavoidable delay"
    "unalloyed delight"
    "unconscionable time"
    "under a cloud"
    "under the weather"
    "unequal task"
    "university of life"
    "unkindest cut of all"
    "unsung heroes"
    "untimely end"
    "untold wealth"
    "unvarnished truth"
    "up to scratch"
    "not up to scratch"
    "upper crust"
    "vanish into thin air"
    "variety is the spice of life"
    "vested interest"
    "vicious circle"
    "vote with their feetwages of sin"
    "waited on hand and foot"
    "walking on broken glass"
    "warts and all"
    "waste not"
    "water under the bridge"
    "wealth of experience"
    "wedded bliss"
    "weighed in the balance and found wanting"
    "well-earned rest"
    "wheels within wheels"
    "when the cats away the mice will play"
    "when the going gets tough "
    "whiter than white"
    "winter of discontent"
    "with all due respect"
    "with bated breath"
    "with malice aforethought"
    "without a shadow of a doubt"
    "without fear of contradiction"
    "woman scorned"
    "wonders will never cease"
    "word to the wise"
    "work my fingers to the bone"
    "world’s your oyster"
    "writing’s on the wall"
    "wrong end of the stick"
    "year in"
    "you can bet your bottom dollar"
    "you can lead a horse to water but you can’t make him drink"
    "you can’t make a silk purse out of a sow’s ear"
    "you can’t teach an old dog new tricks"
    "you can’t win ‘em all"
    "you could have knocked me down with a feather"
    "you get what you pay for"
    "you pays your money and takes your choice"
    "your guess is as good as mine"
    "you’re breaking my heart"
    "you’re only young once")
  "Cliches to avoid."
  :group 'writegood
  :type 'list)



;; flyspell

;; http://emacs.stackexchange.com/questions/14909/how-to-use-flyspell-to-efficiently-correct-previous-word/14912#14912
(defun flyspell-goto-previous-error (arg)
  "Go to arg previous spelling error."
  (interactive "p")
  (while (not (= 0 arg))
    (let ((pos (point))
          (min (point-min)))
      (if (and (eq (current-buffer) flyspell-old-buffer-error)
               (eq pos flyspell-old-pos-error))
          (progn
            (if (= flyspell-old-pos-error min)
                ;; goto beginning of buffer
                (progn
                  (message "Restarting from end of buffer")
                  (goto-char (point-max)))
              (backward-word 1))
            (setq pos (point))))
      ;; seek the next error
      (while (and (> pos min)
                  (let ((ovs (overlays-at pos))
                        (r '()))
                    (while (and (not r) (consp ovs))
                      (if (flyspell-overlay-p (car ovs))
                          (setq r t)
                        (setq ovs (cdr ovs))))
                    (not r)))
        (backward-word 1)
        (setq pos (point)))
      ;; save the current location for next invocation
      (setq arg (1- arg))
      (setq flyspell-old-pos-error pos)
      (setq flyspell-old-buffer-error (current-buffer))
      (goto-char pos)
      (call-interactively 'helm-flyspell-correct)
      (if (= pos min)
          (progn
            (message "No more miss-spelled word!")
            (setq arg 0))))))

;; http://endlessparentheses.com/ispell-and-abbrev-the-perfect-auto-correct.html
(defun ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will be global.

If there's nothing wrong with the word at point, keep looking for
a typo until the beginning of buffer. You can skip typos you
don't want to fix with `SPC', and you can abort completely with
`C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (thing-at-point 'word))
                 ;; Word was corrected or used quit.
                 (if (ispell-word nil 'quiet)
                     nil ; End the loop.
                   ;; Also end if we reach `bob'.
                   (not (bobp)))
               ;; If there's no word at point, keep looking
               ;; until `bob'.
               (not (bobp)))
        (backward-word))
      (setq aft (thing-at-point 'word)))
    (if (and aft bef (not (equal aft bef)))
        (let ((aft (downcase aft))
              (bef (downcase bef)))
          (define-abbrev
            (if p local-abbrev-table global-abbrev-table)
            bef aft)
          (message "\"%s\" now expands to \"%s\" %sally"
                   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(defun message-off-advice (oldfun &rest args)
  "Quiet down messages in adviced OLDFUN."
  (let ((message-off (make-symbol "message-off")))
    (unwind-protect
        (progn
          (advice-add #'message :around #'ignore (list 'name message-off))
          (apply oldfun args))
      (advice-remove #'message message-off))))


;; text-mode hooks
(defun cats/text-mode-defaults ()
  "Default coding hook, useful with any text mode."
  (unless (bound-and-true-p my-tmh-ran)
    ;; add buffer-local indicator for whether text-mode-hook has run.
    (set (make-local-variable 'my-tmh-ran) t)

    ;; `visual-line-mode` is so much better than `auto-fill-mode`. It doesn't
    ;; actually break the text into multiple lines - it only looks that way.
    (spacemacs/toggle-auto-fill-mode-off)
    (spacemacs/toggle-visual-line-navigation-on)))


;;; funcs.el ends here
