'use strict';

var response = require('./res');
var connection = require('./conn');
var formidable = require('formidable');
var fs = require('fs');

const IncomingForm = formidable.IncomingForm

async function formidableDecode(req) {
    const form = new IncomingForm();
    form.multiples = true;
    return new Promise((res, rej) => {
        form.parse(req, (err, fields, files) => {
            if (err) {
                rej(err);
            }
            res({ fields, files });
        });
    });
}

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
		
    app.route('/login')
        .post(function (req, res) {
			
			const user = req.body.user;
			const pass = req.body.pass;
			
            connection.query(`SELECT user, COUNT(*) AS number FROM user WHERE user.user = '${user}' AND user.pass = '${pass}' GROUP BY user.user`
			, function (error, rows, fields) {
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
		
		app.route('/getProposal')
        .get(function (req, res) {
            connection.query('SELECT * FROM proposal ORDER BY id ASC', function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });
		

		app.post('/addProposal',async function (req, res) {

            const { fields, files } = await formidableDecode(req);

            const judul_acara = fields.judul_acara;
            const tanggal_mulai = fields.tanggal_mulai;
            const tanggal_selesai = fields.tanggal_selesai;
            const dikampus = fields.dikampus;
            const tempat = fields.tempat;
            const anggaran = fields.anggaran;
            const file = files.file.path;
            const user = fields.user;
            const aprf = fields.aprf;
            const aprp = fields.aprp;
            const komenf = fields.komenf;
            const komenp = fields.komenp;
			const Lpj = fields.Lpj;
			const submit_date = fields.submit_date;
            const aprf_date = fields.aprf_date;
            const aprp_date = fields.aprp_date;
            const lpj_date = fields.lpj_date;

            const filePath = __dirname + './public/' + files.file.name;
            const dbPath = '/' + files.file.name;
            fs.appendFile(filePath, files.file, () => {
                connection.query(`INSERT INTO proposal VALUES (NULL, '${judul_acara}', '${tanggal_mulai}', '${tanggal_selesai}', ${dikampus}, '${tempat}', '${anggaran}', '${dbPath}', '${user}', '${aprf}', '${aprp}', '${komenf}', '${komenp}', '${Lpj}', '${submit_date}', '${aprf_date}', '${aprp_date}', '${lpj_date}');`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
            })
        });
		

        app.post('/updateLPJ',async function (req, res) {

            const { fields, files } = await formidableDecode(req);

			const Lpj = files.Lpj.path;
            const lpj_date = fields.lpj_date;

            const filePath = __dirname + './public/' + files.Lpj.name;
            const dbPath = '/' + files.Lpj.name;
            fs.appendFile(filePath, files.Lpj, () => {
                connection.query(`UPDATE proposal set Lpj = '${dbPath}', lpj_date = '${lpj_date}' WHERE proposal.ID = ${id};`
                ,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
            })
        });
		
		app.route('/deleteProposal')
        .delete(function (req, res) {

           
            const id = req.body.id;
			
            connection.query(`DELETE FROM propsal WHERE proposal.ID = ${id};`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
        });
		
		 app.route('/feedbackProgdi')
        .post(function (req, res) {

           
            const id = req.body.id;
            const aprf = req.body.aprf;
            const komenf = req.body.komenf;
            const aprf_date = req.body.aprf_date;


            connection.query(`UPDATE proposal set  aprf = '${aprf}', komenf = '${komenf}', aprf_date = '${aprf_date}' WHERE proposal.ID = ${id};`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
        });
		
		app.route('/feedbackFakultas')
        .post(function (req, res) {

           
            const id = req.body.id;
            const aprf = req.body.aprf;
			const komenf = req.body.komenf;
            const aprf_date = req.body.aprf_date;

            connection.query(`UPDATE proposal set  aprf = '${aprf}', komenf = '${komenf}', aprf_date = '${aprf_date}' WHERE proposal.ID = ${id};`,
                function (error, rows, fields) {
                    if (error) {
                        console.log(error)
                    } else {
                        response.ok(rows, res)
                    }
                });
        });
		
		app.route('/feedbackPusat')
        .post(function (req, res) {

           
            const id = req.body.id;
            const aprp = req.body.aprp;
            const komenp = req.body.komenp;
            const aprp_date = req.body.aprp_date;


            connection.query(`UPDATE proposal set  aprp = '${aprp}', komenp = '${komenp}', aprp_date = '${aprp_date}' WHERE proposal.ID = ${id};`,
                function (error, rows, fields) {
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

            const nama_barang = req.body.nama_barang;
            const QTY = req.body.QTY;
            const status = req.body.status;


            connection.query(`INSERT INTO barang VALUES (NULL, '${nama_barang}', ${QTY}, '${status}');`,function (error, rows, fields) {
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
            const nama_barang = req.body.nama_barang;
            const QTY = req.body.QTY;
            const status = req.body.status;


            connection.query(`UPDATE barang set  nama_barang = '${nama_barang}', QTY = ${QTY}, status = '${status}' WHERE barang.ID = ${ID};`,
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
            const nama_tempat = req.body.nama_tempat;
            const status = req.body.status;
            const komen = req.body.komen;
            const submit_date = req.body.submit_date;
            const status_date = req.body.status_date;

            connection.query(`INSERT INTO peminjaman_tempat VALUES (NULL, '${user}', '${acara}', '${tanggal_mulai}', '${tanggal_selesai}', '${nama_tempat}', '${status}', '${komen}', '${submit_date}', '${status_date}');` 
            , function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/feedbackPeminjamanTempat')
        .post(function (req, res) {

            const id = req.body.id;    
            const status = req.body.status;
            const komen = req.body.komen;
            const status_date = req.body.status_date;

            connection.query(`UPDATE peminjaman_tempat set status = '${status}', komen = '${komen}', status_date = '${status_date}' WHERE peminjaman_tempat.id= ${id};`, 
            function (error, rows, fields) {
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
            const nama_barang = req.body.nama_barang;
            const QTY = req.body.QTY;
            const status = req.body.status;
            const komen = req.body.komen;
            const submit_date = req.body.submit_date;
            const status_date = req.body.status_date;

            connection.query(`INSERT INTO peminjaman_barang VALUES (NULL, '${user}', '${acara}', '${tanggal_mulai}', '${tanggal_selesai}', '${nama_barang}', ${QTY}, '${status}', '${komen}', '${submit_date}', '${status_date}');` 
            , function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });

        app.route('/feedbackPeminjamanBarang')
        .post(function (req, res) {

            const id = req.body.id;    
            const status = req.body.status;
            const komen = req.body.komen;
            const status_date = req.body.status_date;

            connection.query(`UPDATE peminjaman_barang set status = '${status}', komen = '${komen}', status_date = '${status_date}' WHERE peminjaman_barang.id= ${id};`, function (error, rows, fields) {
                if (error) {
                    console.log(error)
                } else {
                    response.ok(rows, res)
                }
            });
        });
}