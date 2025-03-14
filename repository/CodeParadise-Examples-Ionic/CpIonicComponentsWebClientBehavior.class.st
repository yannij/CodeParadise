Class {
	#name : #CpIonicComponentsWebClientBehavior,
	#superclass : #CpWebClientBehavior,
	#category : #'CodeParadise-Examples-Ionic-ComponentsApp'
}

{ #category : #examples }
CpIonicComponentsWebClientBehavior >> bodyHtml [

	^ '
<ion-app>
<ion-split-pane when="xs" content-id="main">
 <ion-menu content-id="main">
    <ion-header>
      <ion-toolbar color="tertiary">
        <ion-title>Ionic Components</ion-title>
      </ion-toolbar>
    </ion-header>
    <ion-content class="ion-padding">
      <ion-list id="list"></ion-list>
    </ion-content>
  </ion-menu>

  <div class="ion-page" id="main">
    <ion-content class="ion-padding">
      <div id="output"></div>
    </ion-content>
  </div>
</ion-split-pane>
</ion-app>
'
]

{ #category : #examples }
CpIonicComponentsWebClientBehavior >> exampleButton [

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: ((CpHtmlElement newWithTag: #h1) textContent: 'ion-button'; yourself).

	outputElement
		appendChild: ((CpHtmlElement newWithTag: #h3) textContent: 'Basic Usage'; yourself);
		appendChild: (IonButton new textContent: 'Default'; yourself);
		appendChild: (IonButton new textContent: 'Disabled'; disabled: true; yourself);
		yourself.

	outputElement
		appendChild: ((CpHtmlElement newWithTag: #h3) textContent: 'Shape'; yourself);
		appendChild: (IonButton new textContent: 'Default'; yourself);
		appendChild: (IonButton new textContent: 'Round'; shape: 'round'; yourself);
		appendChild: (IonButton new appendChild: (IonIcon new slot: 'icon-only'; name: 'heart'; yourself); yourself);
		appendChild: (IonButton new appendChild: (IonIcon new slot: 'icon-only'; name: 'heart'; yourself); shape: 'round'; yourself);
		yourself.

	outputElement
		appendChild: ((CpHtmlElement newWithTag: #h3) textContent: 'Fill'; yourself);
		appendChild: (IonButton new textContent: 'Default'; yourself);
		appendChild: (IonButton new textContent: 'Clear'; fill: 'clear'; yourself);
		appendChild: (IonButton new textContent: 'Outline'; fill: 'outline'; yourself);
		appendChild: (IonButton new textContent: 'Solid'; fill: 'solid'; yourself);
		yourself.
]

{ #category : #examples }
CpIonicComponentsWebClientBehavior >> exampleCard [

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: ((CpHtmlElement newWithTag: #h1) textContent: 'ion-card'; yourself).

	outputElement
		appendChild: ((CpHtmlElement newWithTag: #h3) textContent: 'Basic Usage'; yourself);
		appendChild: (
			IonCard new
				appendChild: (IonCardHeader new
					appendChild: (IonCardTitle new textContent: 'Card Title'; yourself);
					appendChild: (IonCardSubtitle new textContent: 'Card Subtitle'; yourself);
					yourself);
				appendChild: (IonCardContent new textContent: 'Here''s a small text description for the card content. Nothing more, nothing less.');
				yourself
			);
		yourself.

	outputElement
		appendChild: ((CpHtmlElement newWithTag: #h3) textContent: 'Media Cards'; yourself);
		appendChild: (
			IonCard new
				markupContent: '<img alt="Silhouette of mountains" src="https://ionicframework.com/docs/img/demos/card-media.png" />';
				appendChild: (IonCardHeader new
					appendChild: (IonCardTitle new textContent: 'Card Title'; yourself);
					appendChild: (IonCardSubtitle new textContent: 'Card Subtitle'; yourself);
					yourself);
				appendChild: (IonCardContent new textContent: 'Here''s a small text description for the card content. Nothing more, nothing less.'; yourself);
				yourself
			);
		yourself.

]

{ #category : #examples }
CpIonicComponentsWebClientBehavior >> exampleRippleEffect [

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: ((CpHtmlElement newWithTag: #h1) textContent: 'ion-ripple-effect'; yourself).

	outputElement
		appendChild: ((CpHtmlElement newWithTag: #h3) textContent: 'Basic Usage'; yourself);
		appendChild: ((CpHtmlElement newWithTag: #div)
			markupContent: self exampleRippleEffectMarkup;
			yourself)
]

{ #category : #examples }
CpIonicComponentsWebClientBehavior >> exampleRippleEffectMarkup [

	^ '
<div class="wrapper">
  <b>Click on a shape to see the ripple</b>

  <div class="ion-activatable ripple-parent rectangle">
    <ion-ripple-effect></ion-ripple-effect>
  </div>

  <div class="ion-activatable ripple-parent rounded-rectangle">
    <ion-ripple-effect></ion-ripple-effect>
  </div>

  <div class="ion-activatable ripple-parent circle">
    <ion-ripple-effect></ion-ripple-effect>
  </div>
</div>

<style>
  .wrapper {
    display: flex;
    flex-wrap: wrap;

    align-items: center;
    justify-content: space-between;
    text-align: center;

    height: 300px;
    width: 300px;

    margin: 0 auto;
  }

  b {
    width: 100%;
  }

  .ripple-parent {
    position: relative;
    overflow: hidden;

    border: 1px solid #ddd;
  }

  .rectangle {
    width: 300px;
    height: 150px;
  }

  .rounded-rectangle {
    width: 185px;
    height: 65px;
    border-radius: 8px;
  }

  .circle {
    width: 90px;
    height: 90px;
    border-radius: 50%;
  }
</style>'
]

{ #category : #examples }
CpIonicComponentsWebClientBehavior >> exampleToDo [

	| outputElement |

	"Clear content"
	outputElement := self outputElement.
	outputElement textContent: ''.

	outputElement appendChild: ((CpHtmlElement newWithTag: #h1) textContent: 'TODO'; yourself)
]

{ #category : #initialization }
CpIonicComponentsWebClientBehavior >> initialize [

	super initialize.

	self showIndex
]

{ #category : #initialization }
CpIonicComponentsWebClientBehavior >> menuData [

	^ {
	'Button' -> {
		'ion-button' -> #exampleButton.
		'ion-ripple-effect' -> #exampleRippleEffect
	}.
	'Card' -> {
		'ion-card' -> #exampleCard.
		'ion-card-content' -> #exampleToDo.
		'ion-card-header' -> #exampleToDo.
		'ion-card-subtitle' -> #exampleToDo.
		'ion-card-title' -> #exampleToDo
	}
}
]

{ #category : #accessing }
CpIonicComponentsWebClientBehavior >> outputElement [

	^ CpHtmlElement documentBody firstDescendantMatching: '#output'
]

{ #category : #initialization }
CpIonicComponentsWebClientBehavior >> showIndex [
	| body list |

	body := CpHtmlElement documentBody.
	body markupContent: self bodyHtml.

	list := body firstDescendantMatching: '#list'.

	self menuData do: [ :eachCategory | | itemGroup items |
		itemGroup := IonItemGroup new.
		itemGroup appendChild: (IonLabel new textContent: eachCategory key; yourself).
		list appendChild: itemGroup.
		items := eachCategory value.
		items do: [ :item | | example |
			example := IonItem new button: true; appendChild: (IonLabel new textContent: item key; yourself); yourself.
			itemGroup appendChild: example.
			example when: CpClickEvent basicPrimary send: item value to: self ] ]
]
