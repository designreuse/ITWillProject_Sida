<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- BODY -->
            <div class="body">
                <section class="content">
                    
<ol class="breadcrumb">
    <li><a href="index.html"><i class="fa fa-home fa-fw"></i> Home</a></li>
    <li class="active">Google Maps</li>
</ol>

<div class="header">
    <div class="col-md-12">
        <h3 class="header-title">Google Maps</h3>
        <p class="header-info">Find local businesses, view maps and get driving directions in Google Maps</p>
    </div>
</div>

<!-- CONTENT -->
    <div class="main-content">
        <div class="row">
            <div class="col-md-12">
                <div class="panel ">
                    <div class="panel-heading">
                        <h3 class="panel-title">Road map view</h3>
                    </div>
                    <div class="panel-body">
                        <div class="map-canvas" road-map="true" map-zoom="11" map-latitude="40.6862611" map-longitude="-74.0115122"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel ">
                    <div class="panel-heading">
                        <h3 class="panel-title">Physical map based on terrain information</h3>
                    </div>
                    <div class="panel-body">
                        <div class="map-canvas" terrain-map="true" map-zoom="11" map-latitude="40.6862611" map-longitude="-74.0115122"></div>
                    </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="panel ">
                    <div class="panel-heading">
                        <h3 class="panel-title">Styled road map view</h3>
                    </div>
                    <div class="panel-body">
                        <div class="map-canvas" styled-map="true" map-zoom="11" map-latitude="40.6862611" map-longitude="-74.0115122"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- END: CONTENT -->
                </section>
            </div>
            <!-- END: BODY -->