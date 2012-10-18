class Problem54 {
  Void main() {
    res := (`fan://eulerFantom/res/poker.txt`.get as File)
        .readAllLines
        .map { fight(it) }
        .findAll { it == 1 }
        .size
    echo(res)
  }

  Int fight(Str decks) {
    return Deck(decks[0..<Deck.strSize]) <=> Deck(decks[Deck.strSize + 1..2 * Deck.strSize])
  }
}

const class Card {
  static const Int minVal := 2
  static const Int maxVal := 14

  private static const Str vals := "23456789TJQKA"
  private static const Regex pattern := Regex<|^[23456789TJQKA][HDCS]$|>

  const Int val
  const Str suit

  new make(Str str) {
    if (!pattern.matches(str)) throw ArgErr(str)
    this.val = vals.index(str[0..0]) + 2
    this.suit = str[1..1]
  }

  override Int compare(Obj that) {
    return val <=> (that as Card).val
  }
}

const class Deck {
  static const Int strSize := 14

  const Card[] cards

  new make(Str str) {
    cards = str.split.map { Card(it) }.sortr
    if (cards.size != 5) throw ArgErr(str)
  }

  override Int compare(Obj that) {
    return listCompare(this.score, (that as Deck).score)
  }

  private Obj[] score() {
    return [Rank.of(this), Rank.of(this).match(this)].addAll(cards)
  }

  private Int listCompare(Obj[] list1, Obj[] list2) {
    for (i := 0; i < list1.size && i < list2.size; i++) {
      cmp := list1[i] <=> list2[i]
      if (cmp != 0) return cmp
    }
    return list1.size <=> list2.size
  }
}

enum class Rank {
  highCard(|deck| { deck.cards[0] }),
  onePair(|deck| {
    deck.cards.find |card, idx| { idx < 4 && card.val == deck.cards[idx + 1].val }
  }),
  twoPairs(|deck| {
    if (deck.cards[0].val == deck.cards[1].val && deck.cards[2].val == deck.cards[3].val) {
      return deck.cards[0]
    } else if (deck.cards[0].val == deck.cards[1].val && deck.cards[3].val == deck.cards[4].val) {
      return deck.cards[0]
    } else if (deck.cards[1].val == deck.cards[2].val && deck.cards[3].val == deck.cards[4].val) {
      return deck.cards[1]
    } else {
      return null
    }
  }),
  threeOfKind(|deck| {
    deck.cards.find |card, idx| { idx < 3 && card.val == deck.cards[idx + 2].val }
  }),
  straight(|deck| {
    if ((0..3).toList.all { deck.cards[it] > deck.cards[it + 1] } &&
        deck.cards[0].val - deck.cards[4].val == 4) {
      return deck.cards[0]
    } else {
      return null
    }
  }),
  flush(|deck| {
    deck.cards.map { it.suit }.unique.size == 1 ? deck.cards[0] : null
  }),
  fullHouse(|deck| {
    if (deck.cards[0].val == deck.cards[2].val && deck.cards[3].val == deck.cards[4].val) {
      return deck.cards[0]
    } else if (deck.cards[0].val == deck.cards[1].val && deck.cards[2].val == deck.cards[4].val) {
      return deck.cards[2]
    } else {
      return null
    }
  }),
  fourOfKind(|deck| {
    deck.cards.find |card, idx| { idx < 2 && card.val == deck.cards[idx + 3].val }
  }),
  straightFlush(|deck| {
    straight.match(deck) != null && flush.match(deck) != null ? deck.cards[0] : null
  }),
  royalFlush(|deck| {
    straightFlush.match(deck) != null && deck.cards[0].val == Card.maxVal ? deck.cards[0] : null
  })

  private const |Deck -> Card?| deckToCard

  private new make(|Deck -> Card?| deckToCard) {
    this.deckToCard = deckToCard
  }

  Card? match(Deck deck) {
    return deckToCard(deck)
  }

  static Rank of(Deck deck) {
    return Rank.vals.dup.reverse.find { it.match(deck) != null }
  }
}
