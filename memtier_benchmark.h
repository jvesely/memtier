/*
 * Copyright (C) 2011-2013 Garantia Data Ltd.
 *
 * This file is part of memtier_benchmark.
 *
 * memtier_benchmark is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, version 2.
 *
 * memtier_benchmark is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with memtier_benchmark.  If not, see <http://www.gnu.org/licenses/>.
 */

#ifndef _MEMTIER_BENCHMARK_H
#define _MEMTIER_BENCHMARK_H

#include <vector>
#include "config_types.h"

#define LOGLEVEL_ERROR 0
#define LOGLEVEL_DEBUG 1

#define benchmark_debug_log(...) \
    benchmark_log_file_line(LOGLEVEL_DEBUG, __FILE__, __LINE__, __VA_ARGS__)

#define benchmark_error_log(...) \
    benchmark_log(LOGLEVEL_ERROR, __VA_ARGS__)

struct benchmark_config {
    const char *server;
    unsigned short port;
    struct server_addr *server_addr;
    const char *unix_socket;
    const char *protocol;
    const char *out_file;
    const char *client_stats;
    unsigned int run_count;
    int debug;
    int show_config;
    int hide_histogram;
    int distinct_client_seed;
    int randomize;
    int next_client_idx;
    unsigned int requests;
    unsigned int clients;
    unsigned int threads;
    unsigned int test_time;
    config_ratio ratio;
    unsigned int pipeline;
    unsigned int data_size;
    unsigned int data_offset;
    bool random_data;
    struct config_range data_size_range;
    config_weight_list data_size_list;
    const char *data_size_pattern;
    struct config_range expiry_range;
    const char *data_import;
    int data_verify;
    int verify_only;
    int generate_keys;
    const char *key_prefix;
    unsigned int key_minimum;
    unsigned int key_maximum;
    double key_stddev;
    double key_median;
    const char *key_pattern;
    unsigned int reconnect_interval;
    int multi_key_get;
    const char *authenticate;
    int select_db;
    bool no_expiry;
    bool resolve_on_connect;
    bool transaction_latency;
    unsigned short key_width;
    bool use_udp;
};


extern void benchmark_log_file_line(int level, const char *filename, unsigned int line, const char *fmt, ...);
extern void benchmark_log(int level, const char *fmt, ...);

#endif /* _MEMTIER_BENCHMARK_H */

