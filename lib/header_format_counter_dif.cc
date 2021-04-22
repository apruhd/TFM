/* -*- c++ -*- */
/*
 * Copyright 2021 gr-TFMv2 author.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

#include <gnuradio/digital/header_buffer.h>
#include <gnuradio/math.h>
#include <string.h>
#include <volk/volk_alloc.hh>
#include <iomanip>
#include <iostream>

#include <gnuradio/io_signature.h>
#include <TFMv3/header_format_counter_dif.h>

namespace gr {
namespace TFMv3 {

header_format_counter_dif::sptr
header_format_counter_dif::make(const std::string& access_code, int threshold, int bps)
{
    return header_format_counter_dif::sptr(
        new header_format_counter_dif(access_code, threshold, bps));
}

header_format_counter_dif::header_format_counter_dif(const std::string& access_code,
                                             int threshold,
                                             int bps)
    : header_format_default(access_code, threshold, bps)
{
    d_counter = 0;
}

header_format_counter_dif::~header_format_counter_dif() {}

bool header_format_counter_dif::format(int nbytes_in,
                                   const unsigned char* input,
                                   pmt::pmt_t& output,
                                   pmt::pmt_t& info)

{
    // Creating the output pmt copies data; free our own here when done.
    volk::vector<uint8_t> bytes_out(header_nbytes());

    digital::header_buffer header(bytes_out.data());
    header.add_field64(d_access_code, d_access_code_len);
    header.add_field16((uint16_t)(nbytes_in));
    header.add_field16((uint16_t)(nbytes_in));
    header.add_field16((uint16_t)(d_bps));
    header.add_field16((uint16_t)(d_counter));

    // Package output data into a PMT vector
    output = pmt::init_u8vector(header_nbytes(), bytes_out.data());

    d_counter++;

    return true;
}

size_t header_format_counter_dif::header_nbits() const
{
    return d_access_code_len + 8 * 4 * sizeof(uint16_t);
}

bool header_format_counter_dif::header_ok()
{
    // confirm that two copies of header info are identical
    uint16_t len0 = d_hdr_reg.extract_field16(0);
    uint16_t len1 = d_hdr_reg.extract_field16(16);
    return (len0 ^ len1) == 0;
}

int header_format_counter_dif::header_payload()
{
    uint16_t len = d_hdr_reg.extract_field16(0);
    uint16_t bps = d_hdr_reg.extract_field16(32);
    uint16_t counter = d_hdr_reg.extract_field16(48);

    d_bps = bps;

    d_info = pmt::make_dict();
    d_info = pmt::dict_add(
        d_info, pmt::intern("payload symbols"), pmt::from_long(8 * len / d_bps));
    d_info = pmt::dict_add(d_info, pmt::intern("bps"), pmt::from_long(bps));
    d_info = pmt::dict_add(d_info, pmt::intern("counter"), pmt::from_long(counter));
    return static_cast<int>(len);
}

} /* namespace TFMv3 */
} /* namespace gr */
