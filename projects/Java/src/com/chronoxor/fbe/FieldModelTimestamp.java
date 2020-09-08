// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: FBE
// Version: 1.3.0.0

package com.chronoxor.fbe;

// Fast Binary Encoding timestamp field model
public final class FieldModelTimestamp extends FieldModel
{
    public FieldModelTimestamp(Buffer buffer, long offset) { super(buffer, offset); }

    // Get the field size
    @Override
    public long fbeSize() { return 8; }

    // Get the timestamp value
    public java.time.Instant get() { return get(java.time.Instant.EPOCH); }
    public java.time.Instant get(java.time.Instant defaults)
    {
        assert (defaults != null) : "Invalid default timestamp value!";
        if (defaults == null)
            throw new IllegalArgumentException("Invalid default timestamp value!");

        if ((_buffer.getOffset() + fbeOffset() + fbeSize()) > _buffer.getSize())
            return defaults;

        long nanoseconds = readInt64(fbeOffset());
        return java.time.Instant.ofEpochSecond(nanoseconds / 1000000000, nanoseconds % 1000000000);
    }

    // Set the timestamp value
    public void set(java.time.Instant value)
    {
        assert (value != null) : "Invalid timestamp value!";
        if (value == null)
            throw new IllegalArgumentException("Invalid timestamp value!");

        assert ((_buffer.getOffset() + fbeOffset() + fbeSize()) <= _buffer.getSize()) : "Model is broken!";
        if ((_buffer.getOffset() + fbeOffset() + fbeSize()) > _buffer.getSize())
            return;

        long nanoseconds = value.getEpochSecond() * 1000000000 + value.getNano();
        write(fbeOffset(), nanoseconds);
    }
}