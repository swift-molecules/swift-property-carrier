public import enum Carrier.Carrier
public import struct Property.Property

extension Property: @retroactive Carrier.`Protocol` where Base: ~Copyable {

    public typealias Underlying = Base

    public typealias Domain = Tag

    @inlinable
    public var underlying: Base {
        _read { yield base }
    }
}
