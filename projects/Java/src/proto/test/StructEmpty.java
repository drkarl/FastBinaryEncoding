// Automatically generated by the Fast Binary Encoding compiler, do not modify!
// https://github.com/chronoxor/FastBinaryEncoding
// Source: test.fbe
// Version: 1.3.0.0

package test;

import java.io.*;
import java.lang.*;
import java.lang.reflect.*;
import java.math.*;
import java.nio.ByteBuffer;
import java.nio.charset.*;
import java.time.*;
import java.util.*;

import fbe.*;
import proto.*;

public class StructEmpty implements Comparable<Object>
{
    public StructEmpty() {}

    public StructEmpty(StructEmpty other)
    {
    }

    public StructEmpty clone()
    {
        // Serialize the struct to the FBE stream
        var writer = new test.fbe.StructEmptyModel();
        writer.serialize(this);

        // Deserialize the struct from the FBE stream
        var reader = new test.fbe.StructEmptyModel();
        reader.attach(writer.getBuffer());
        return reader.deserialize();
    }

    @Override
    public int compareTo(Object other)
    {
        if (other == null)
            return -1;

        if (!StructEmpty.class.isAssignableFrom(other.getClass()))
            return -1;

        final StructEmpty obj = (StructEmpty)other;

        int result = 0;
        return result;
    }

    @Override
    public boolean equals(Object other)
    {
        if (other == null)
            return false;

        if (!StructEmpty.class.isAssignableFrom(other.getClass()))
            return false;

        final StructEmpty obj = (StructEmpty)other;

        return true;
    }

    @Override
    public int hashCode()
    {
        int hash = 17;
        return hash;
    }

    @Override
    public String toString()
    {
        var sb = new StringBuilder();
        sb.append("StructEmpty(");
        sb.append(")");
        return sb.toString();
    }

    public String toJson() { return test.fbe.Json.getEngine().toJson(this); }
    public static StructEmpty fromJson(String json) { return test.fbe.Json.getEngine().fromJson(json, StructEmpty.class); }
}