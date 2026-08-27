# swift-property-carrier

Cross-domain integration between Property and Carrier.

This package owns `Property`'s retroactive `Carrier.Protocol` conformance. A
property carries its base value as `Underlying` and preserves its phantom tag as
the Carrier `Domain`, allowing generic carrier operations without erasing the
property's semantic identity.
