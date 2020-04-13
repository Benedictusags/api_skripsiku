'use strict';

var response = require('./res');
var connection = require('./conn');

module.exports = function (app) {
    var todoList = require('./controller');

    app.route('/getUser')
        .get(function (req, res) {
            connection.query('SELECT * FROM user', function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

    app.route('/addUser')
        .post(function (req, res) {

            const email = req.body.email;
            const pass = req.body.pass;
            const user = req.body.user;

            connection.query(`INSERT INTO user VALUES ('${email}', '${pass}', '${user}');`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
        });


    app.route('/addProposal')
        .post(function (req, res) {

            const judul_acara = req.body.judul_acara;
            const tanggal_mulai = req.body.tanggal_mulai;
            const tanggal_selesai = req.body.tanggal_selesai;
            const dikampus = req.body.dikampus;
            const tempat = req.body.tempat;
            const anggaran = req.body.anggaran;
            const file = req.body.file;
            const user = req.body.user;
            const aprf = req.body.aprf;
            const aprp = req.body.aprp;
            const komenf = req.body.komenf;
            const komenp = req.body.komenp;
			const Lpj = req.body.Lpj;
			


            connection.query(`INSERT INTO proposal VALUES (NULL, '${judul_acara}', '${tanggal_mulai}', '${tanggal_selesai}', ${dikampus}, '${tempat}', '${anggaran}', '${file}', '${user}', '${aprf}', '${aprp}', '${komenf}', '${komenp}', '${Lpj}');`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
        });


    app.route('/updateProposal')
        .post(function (req, res) {

           
            const id = req.body.id;
            const aprf = req.body.aprf;
            const aprp = req.body.aprp;
            const komenf = req.body.komenf;
            const komenp = req.body.komenp;
			const Lpj = req.body.Lpj;


            connection.query(`UPDATE proposal set  aprf = '${aprf}', aprp = '${aprp}', komenf = '${komenf}', komenp = '${komenp}' , Lpj = '${Lpj}' WHERE proposal.ID = ${id};`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
        });

    app.route('/getProposal')
        .get(function (req, res) {
            connection.query('SELECT * FROM proposal', function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/getBarang')
        .get(function (req, res) {
            connection.query('SELECT * FROM barang', function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/addBarang')
        .post(function (req, res) {

            const Nama_Barang = req.body.Nama_Barang;
            const QTY = req.body.QTY;
            const status = req.body.status;


            connection.query(`INSERT INTO barang VALUES (NULL, '${Nama_Barang}', ${QTY}, '${status}');`,function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
                
        });

        app.route('/updateBarang')
        .post(function (req, res) {
            
            const ID = req.body.ID;
            const nama_barang = req.body.Nama_Barang;
            const QTY = req.body.QTY;
            const status = req.body.status;


            connection.query(`UPDATE barang set  Nama_Barang = '${nama_barang}', QTY = ${QTY}, status = '${status}' WHERE barang.ID = ${ID};`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
                
        });

        app.route('/getTempat')
        .get(function (req, res) {
            connection.query('SELECT * FROM tempat', function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/addTempat')
        .post(function (req, res) {

            const nama_tempat = req.body.nama_tempat;
            const deskripsi = req.body.deskripsi;
            const status = req.body.status;


            connection.query(`INSERT INTO tempat VALUES (NULL, '${nama_tempat}', '${deskripsi}', '${status}');`,function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
                
        });

        app.route('/updateTempat')
        .post(function (req, res) {
            
            const id = req.body.id;
            const nama_tempat = req.body.nama_tempat;
            const deskripsi = req.body.deskripsi;
            const status = req.body.status;


            connection.query(`UPDATE tempat set  nama_tempat = '${nama_tempat}', deskripsi = '${deskripsi}', status = '${status}' WHERE tempat.id = ${id};`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
                
        });

        app.route('/getPeminjamanTempat')
        .get(function (req, res) {
            connection.query('SELECT * FROM peminjaman_tempat', function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/addPeminjamanTempat')
        .post(function (req, res) {

            const user = req.body.user;
            const acara = req.body.acara;
            const tanggal_mulai = req.body.tanggal_mulai;
            const tanggal_selesai = req.body.tanggal_selesai;
            const nama_tempat = req.body.tempat;
            const status = req.body.status;
            const komen = req.body.komen;

            connection.query(`INSERT INTO peminjaman_tempat VALUES (NULL, '${user}', '${acara}', '${tanggal_mulai}', '${tanggal_selesai}', '${nama_tempat}', '${status}', '${komen}');` 
            , function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/updatePeminjamanTempat')
        .post(function (req, res) {

            const id = req.body.id;    
            const status = req.body.status;
            const komen = req.body.komen;

            connection.query(`UPDATE peminjaman_tempat set status = ${status}', komen = '${komen}' WHERE peminjaman_tempat.id= ${id};`, function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/getPeminjamanBarang')
        .get(function (req, res) {
            connection.query('SELECT * FROM peminjaman_barang', function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/addPeminjamanBarang')
        .post(function (req, res) {

            const user = req.body.user;
            const acara = req.body.acara;
            const tanggal_mulai = req.body.tanggal_mulai;
            const tanggal_selesai = req.body.tanggal_selesai;
            const nama_barang = req.body.barang;
            const QTY = req.body.QTY;
            const status = req.body.status;
            const komen = req.body.komen;

            connection.query(`INSERT INTO peminjaman_barang VALUES (NULL, '${user}', '${acara}', '${tanggal_mulai}', '${tanggal_selesai}', '${nama_barang}', ${QTY}, '${status}', '${komen}');` 
            , function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/updatePeminjamanBarang')
        .post(function (req, res) {

            const id = req.body.id;    
            const status = req.body.status;
            const komen = req.body.komen;

            connection.query(`UPDATE peminjaman_barang set status = ${status}', komen = '${komen}' WHERE peminjaman_barang.id= ${id};`, function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });
}