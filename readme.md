
knockout-hammer
===

Features
---

1. Hammer style callbacks for knockout bindings
> Provided by hammer.js

```
hmTap: ( evt ) -> this.select evt.target
```

2. Specific option customization

```
hmTap:
    taps: 2
    handler: ( evt ) -> this.select evt.target
```

3. Global option customization

```
hmOptions:
    domEvents: true
hmTap: ( evt ) -> this.select evt.target
```

